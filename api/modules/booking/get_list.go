package booking

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"net/http"
	"strconv"

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

	// 根据 bookingId 查询
	if id != "" && pid == "" {
		qeurySql = qeurySql + " where id = " + id + ""
	}
	// 根据 productId 查询
	if pid != "" && id == "" {
		qeurySql = qeurySql + " where product_id = " + pid + ""
	}
	// 根据 productId 和 bookingId 查询
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

// GetListByUID 可根据 uid  查询
func GetListByUID(c echo.Context) error {
	engine := db.Engine
	var bookings Bookings
	uid, _ := strconv.Atoi(c.Param("uid"))
	engine.Sql("SELECT * FROM booking WHERE uid = ?", uid).Find(&bookings.Data)
	res := common.Response{
		Code:    http.StatusOK,
		Message: http.StatusText(http.StatusOK),
		Data:    bookings.Data,
	}
	return c.JSON(http.StatusOK, res)
}

// GetListByUID 可根据 uid  查询
func GetListByPublisherID(c echo.Context) error {
	engine := db.Engine
	var bookings Bookings
	publisherId, _ := strconv.Atoi(c.Param("uid"))
	engine.Sql("SELECT * FROM booking WHERE publisher_id = ?", publisherId).Find(&bookings.Data)
	res := common.Response{
		Code:    http.StatusOK,
		Message: http.StatusText(http.StatusOK),
		Data:    bookings.Data,
	}
	return c.JSON(http.StatusOK, res)
}
