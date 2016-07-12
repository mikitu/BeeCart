package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type DefaultData_20160709_194826 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &DefaultData_20160709_194826{}
	m.Created = "20160709_194826"
	migration.Register("DefaultData_20160709_194826", m)
}

// Run the migrations
func (m *DefaultData_20160709_194826) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	// use goose migration tool for create database structure and insert default data

}

// Reverse the migrations
func (m *DefaultData_20160709_194826) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update

}
