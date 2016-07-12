package models

import (
	"errors"
	"fmt"
	"reflect"
	"strings"
	"time"

	"github.com/astaxie/beego/orm"
)

type Affiliate struct {
	Id                int       `orm:"column(id);auto"`
	Firstname         string    `orm:"column(firstname);size(32)"`
	Lastname          string    `orm:"column(lastname);size(32)"`
	Email             string    `orm:"column(email);size(96)"`
	Telephone         string    `orm:"column(telephone);size(32)"`
	Fax               string    `orm:"column(fax);size(32)"`
	Password          string    `orm:"column(password);size(40)"`
	Salt              string    `orm:"column(salt);size(9)"`
	Company           string    `orm:"column(company);size(40)"`
	Website           string    `orm:"column(website);size(255)"`
	Address1          string    `orm:"column(address_1);size(128)"`
	Address2          string    `orm:"column(address_2);size(128)"`
	City              string    `orm:"column(city);size(128)"`
	Postcode          string    `orm:"column(postcode);size(10)"`
	CountryId         *Country  `orm:"column(country_id);rel(fk)"`
	ZoneId            *Zone     `orm:"column(zone_id);rel(fk)"`
	Code              string    `orm:"column(code);size(64)"`
	Commission        float64   `orm:"column(commission);digits(4);decimals(2)"`
	Tax               string    `orm:"column(tax);size(64)"`
	Payment           string    `orm:"column(payment);size(6)"`
	Cheque            string    `orm:"column(cheque);size(100)"`
	Paypal            string    `orm:"column(paypal);size(64)"`
	BankName          string    `orm:"column(bank_name);size(64)"`
	BankBranchNumber  string    `orm:"column(bank_branch_number);size(64)"`
	BankSwiftCode     string    `orm:"column(bank_swift_code);size(64)"`
	BankAccountName   string    `orm:"column(bank_account_name);size(64)"`
	BankAccountNumber string    `orm:"column(bank_account_number);size(64)"`
	Ip                string    `orm:"column(ip);size(40)"`
	Status            int8      `orm:"column(status)"`
	Approved          int8      `orm:"column(approved)"`
	DateAdded         time.Time `orm:"column(date_added);type(datetime)"`
}

func (t *Affiliate) TableName() string {
	return "affiliate"
}

func init() {
	orm.RegisterModel(new(Affiliate))
}

// AddAffiliate insert a new Affiliate into database and returns
// last inserted Id on success.
func AddAffiliate(m *Affiliate) (id int64, err error) {
	o := orm.NewOrm()
	id, err = o.Insert(m)
	return
}

// GetAffiliateById retrieves Affiliate by Id. Returns error if
// Id doesn't exist
func GetAffiliateById(id int) (v *Affiliate, err error) {
	o := orm.NewOrm()
	v = &Affiliate{Id: id}
	if err = o.Read(v); err == nil {
		return v, nil
	}
	return nil, err
}

// GetAllAffiliate retrieves all Affiliate matches certain condition. Returns empty list if
// no records exist
func GetAllAffiliate(query map[string]string, fields []string, sortby []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(Affiliate))
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

	var l []Affiliate
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

// UpdateAffiliate updates Affiliate by Id and returns error if
// the record to be updated doesn't exist
func UpdateAffiliateById(m *Affiliate) (err error) {
	o := orm.NewOrm()
	v := Affiliate{Id: m.Id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Update(m); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}

// DeleteAffiliate deletes Affiliate by Id and returns error if
// the record to be deleted doesn't exist
func DeleteAffiliate(id int) (err error) {
	o := orm.NewOrm()
	v := Affiliate{Id: id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Delete(&Affiliate{Id: id}); err == nil {
			fmt.Println("Number of records deleted in database:", num)
		}
	}
	return
}
