package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type DbStructure_20160709_184502 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &DbStructure_20160709_184502{}
	m.Created = "20160709_184502"
	migration.Register("DbStructure_20160709_184502", m)
}

// Run the migrations
func (m *DbStructure_20160709_184502) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	// use goose migration tool for create database structure
}

// Reverse the migrations
func (m *DbStructure_20160709_184502) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update

}
