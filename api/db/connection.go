package db

import (
	"fmt"

	"github.com/go-xorm/xorm"
)

var Engine *xorm.Engine

// var Db *sql.Db

// CreatConn For Create mysql connection
func CreatConn() {
	engine, err := xorm.NewEngine("mysql", "root@/bua_rsp?charset=utf8")
	Engine = engine
	if err != nil {
		fmt.Println(err.Error())
	} else {
		fmt.Println("db engine is connected")
	}
	// defer db.Close()
	// make sure connection is available
	err = engine.Ping()
	fmt.Println(err)
	if err != nil {
		fmt.Println("db engine is not connected")
		fmt.Println(err.Error())
	}
}

// func CreatConn() {
// 	db, err := sql.Open("mysql", "root@/bua_rsp?charset=utf8")
// 	Db = db
// 	if err != nil {
// 		fmt.Println(err.Error())
// 	} else {
// 		fmt.Println("db is connected")
// 	}
// 	// defer db.Close()
// 	// make sure connection is available
// 	err = db.Ping()
// 	fmt.Println(err)
// 	if err != nil {
// 		fmt.Println("db is not connected")
// 		fmt.Println(err.Error())
// 	}
// }
