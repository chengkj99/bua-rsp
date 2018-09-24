package booking

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"net/http"

	"github.com/labstack/echo"
)

// 可根据 id 和 product_id  查询
func GetList(c echo.Context) error {
	engine := db.Engine
	var bookings Bookings

	var qeurySql string
	id := c.FormValue("id")
	pid := c.FormValue("pid")
	qeurySql = "SELECT * FROM booking"

	if id != "" && pid == "" {
		qeurySql = qeurySql + " where id = " + id + ""
	}
	if pid != "" && id == "" {
		qeurySql = qeurySql + " where product_id = " + pid + ""
	}
	if pid != "" && id != "" {
		qeurySql = qeurySql + " where id = " + id + " and product_id = " + pid + ""
	}

	engine.Sql(qeurySql).Find(&bookings.Data)
	res := common.Response{
		bookings.Data,
		http.StatusOK,
		http.StatusText(http.StatusOK),
	}
	return c.JSON(http.StatusOK, res)
}
