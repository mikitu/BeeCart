package models

import (
	"errors"
	"fmt"
	"reflect"
	"strings"
	"time"

	"github.com/astaxie/beego/orm"
)

type ApiSession struct {
	Id           int       `orm:"column(id);auto"`
	ApiId        *Api      `orm:"column(api_id);rel(fk)"`
	Token        string    `orm:"column(token);size(32)"`
	SessionId    string    `orm:"column(session_id);size(32)"`
	SessionName  string    `orm:"column(session_name);size(32)"`
	Ip           string    `orm:"column(ip);size(40)"`
	DateAdded    time.Time `orm:"column(date_added);type(datetime)"`
	DateModified time.Time `orm:"column(date_modified);type(datetime)"`
}

func (t *ApiSession) TableName() string {
	return "api_session"
}

func init() {
	orm.RegisterModel(new(ApiSession))
}

// AddApiSession insert a new ApiSession into database and returns
// last inserted Id on success.
func AddApiSession(m *ApiSession) (id int64, err error) {
	o := orm.NewOrm()
	id, err = o.Insert(m)
	return
}

// GetApiSessionById retrieves ApiSession by Id. Returns error if
// Id doesn't exist
func GetApiSessionById(id int) (v *ApiSession, err error) {
	o := orm.NewOrm()
	v = &ApiSession{Id: id}
	if err = o.Read(v); err == nil {
		return v, nil
	}
	return nil, err
}

// GetAllApiSession retrieves all ApiSession matches certain condition. Returns empty list if
// no records exist
func GetAllApiSession(query map[string]string, fields []string, sortby []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(ApiSession))
	// query k=v
	for k, v := range query {
		// rewrite dot-notation to Object__Attribute
		k = strings.Replace(k, ".", "__", -1)
		qs = qs.Filter(k, v)
	}
	// order by:
	var sortFields []string
	if len(sortby) != 0 {
		if len(sortby) == len(order) {
			// 1) for each sort field, there is an associated order
			for i, v := range sortby {
				orderby := ""
				if order[i] == "desc" {
					orderby = "-" + v
				} else if order[i] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
			qs = qs.OrderBy(sortFields...)
		} else if len(sortby) != len(order) && len(order) == 1 {
			// 2) there is exactly one order, all the sorted fields will be sorted by this order
			for _, v := range sortby {
				orderby := ""
				if order[0] == "desc" {
					orderby = "-" + v
				} else if order[0] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
		} else if len(sortby) != len(order) && len(order) != 1 {
			return nil, errors.New("Error: 'sortby', 'order' sizes mismatch or 'order' size is not 1")
		}
	} else {
		if len(order) != 0 {
			return nil, errors.New("Error: unused 'order' fields")
		}
	}

	var l []ApiSession
	qs = qs.OrderBy(sortFields...)
	if _, err := qs.Limit(limit, offset).All(&l, fields...); err == nil {
		if len(fields) == 0 {
			for _, v := range l {
				ml = append(ml, v)
			}
		} else {
			// trim unused fields
			for _, v := range l {
				m := make(map[string]interface{})
				val := reflect.ValueOf(v)
				for _, fname := range fields {
					m[fname] = val.FieldByName(fname).Interface()
				}
				ml = append(ml, m)
			}
		}
		return ml, nil
	}
	return nil, err
}

// UpdateApiSession updates ApiSession by Id and returns error if
// the record to be updated doesn't exist
func UpdateApiSessionById(m *ApiSession) (err error) {
	o := orm.NewOrm()
	v := ApiSession{Id: m.Id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Update(m); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}

// DeleteApiSession deletes ApiSession by Id and returns error if
// the record to be deleted doesn't exist
func DeleteApiSession(id int) (err error) {
	o := orm.NewOrm()
	v := ApiSession{Id: id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Delete(&ApiSession{Id: id}); err == nil {
			fmt.Println("Number of records deleted in database:", num)
		}
	}
	return
}
