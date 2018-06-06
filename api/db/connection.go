package db

import (
	"database/sql"
	"fmt"
)

var Db *sql.DB

// CreatConn For Create mysql connection
func CreatConn() {
	db, err := sql.Open("mysql", "root@/bua_rsp?charset=utf8")
	Db = db
	if err != nil {
		fmt.Println(err.Error())
	} else {
		fmt.Println("db is connected")
	}
	// defer db.Close()
	// make sure connection is available
	err = db.Ping()
	fmt.Println(err)
	if err != nil {
		fmt.Println("db is not connected")
		fmt.Println(err.Error())
	}
}
