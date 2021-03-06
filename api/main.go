package main

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/booking"
	"bua-rsp/api/modules/overview"
	"bua-rsp/api/modules/price"
	"bua-rsp/api/modules/product"
	"bua-rsp/api/modules/publisher"
	"bua-rsp/api/modules/user"

	_ "github.com/go-sql-driver/mysql"
	"github.com/labstack/echo"
)

func main() {
	e := echo.New()

	db.CreatConn()

	overview.Route(e.Group("/overview"))
	product.Route(e.Group("/product"))
	booking.Route(e.Group("/booking"))
	user.Route(e.Group("/user"))
	publisher.Route(e.Group("/publisher"))
	price.Route(e.Group("/price"))

	e.Logger.Fatal(e.Start(":1323"))
}
