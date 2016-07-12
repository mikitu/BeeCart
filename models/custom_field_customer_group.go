package models

type CustomFieldCustomerGroup struct {
	CustomFieldId   *CustomField   `orm:"column(custom_field_id);rel(fk)"`
	CustomerGroupId *CustomerGroup `orm:"column(customer_group_id);rel(fk)"`
	Required        int8           `orm:"column(required)"`
}
