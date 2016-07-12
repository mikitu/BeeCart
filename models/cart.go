package models

import (
	"errors"
	"fmt"
	"reflect"
	"strings"
	"time"

	"github.com/astaxie/beego/orm"
)

type Cart struct {
	Id          int        `orm:"column(id);auto"`
	CustomerId  *Customer  `orm:"column(customer_id);rel(fk)"`
	SessionId   string     `orm:"column(session_id);size(32)"`
	ProductId   *Product   `orm:"column(product_id);rel(fk)"`
	RecurringId *Recurring `orm:"column(recurring_id);rel(fk)"`
	Option      string     `orm:"column(option)"`
	Quantity    int        `orm:"column(quantity)"`
	DateAdded   time.Time  `orm:"column(date_added);type(datetime)"`
}

func (t *Cart) TableName() string {
	return "cart"
}

func init() {
	orm.RegisterModel(new(Cart))
}

// AddCart insert a new Cart into database and returns
// last inserted Id on success.
func AddCart(m *Cart) (id int64, err error) {
	o := orm.NewOrm()
	id, err = o.Insert(m)
	return
}

// GetCartById retrieves Cart by Id. Returns error if
// Id doesn't exist
func GetCartById(id int) (v *Cart, err error) {
	o := orm.NewOrm()
	v = &Cart{Id: id}
	if err = o.Read(v); err == nil {
		return v, nil
	}
	return nil, err
}

// GetAllCart retrieves all Cart matches certain condition. Returns empty list if
// no records exist
func GetAllCart(query map[string]string, fields []string, sortby []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(Cart))
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

	var l []Cart
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

// UpdateCart updates Cart by Id and returns error if
// the record to be updated doesn't exist
func UpdateCartById(m *Cart) (err error) {
	o := orm.NewOrm()
	v := Cart{Id: m.Id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Update(m); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}

// DeleteCart deletes Cart by Id and returns error if
// the record to be deleted doesn't exist
func DeleteCart(id int) (err error) {
	o := orm.NewOrm()
	v := Cart{Id: id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Delete(&Cart{Id: id}); err == nil {
			fmt.Println("Number of records deleted in database:", num)
		}
	}
	return
}
