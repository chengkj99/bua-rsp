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
	uid, _ := strconv.Atoi(c.Param("id"))
	engine.Sql("SELECT * FROM booking WHERE uid = ? ORDER BY start_time DESC", uid).Find(&bookings.Data)
	res := common.Response{
		Code:    http.StatusOK,
		Message: http.StatusText(http.StatusOK),
		Data:    bookings.Data,
	}
	return c.JSON(http.StatusOK, res)
}

// GetListByPublisherID 可根据 publisher_id  查询
func GetListByPublisherID(c echo.Context) error {
	engine := db.Engine
	var bookings Bookings
	publisherID, _ := strconv.Atoi(c.Param("id"))
	engine.Sql("SELECT * FROM booking WHERE publisher_id = ? ORDER BY start_time DESC", publisherID).Find(&bookings.Data)
	res := common.Response{
		Code:    http.StatusOK,
		Message: http.StatusText(http.StatusOK),
		Data:    bookings.Data,
	}
	return c.JSON(http.StatusOK, res)
}

// GetListByProductID 可根据 productID  查询
func GetListByProductID(c echo.Context) error {
	engine := db.Engine
	var bookings Bookings
	publisherID, _ := strconv.Atoi(c.Param("id"))
	engine.Sql("SELECT * FROM booking WHERE product_id = ? ORDER BY start_time DESC", publisherID).Find(&bookings.Data)
	res := common.Response{
		Code:    http.StatusOK,
		Message: http.StatusText(http.StatusOK),
		Data:    bookings.Data,
	}
	return c.JSON(http.StatusOK, res)
}
