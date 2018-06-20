package booking

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"net/http"

	"github.com/labstack/echo"
)

func GetList(c echo.Context) error {
	engine := db.Engine
	var bookings Bookings

	engine.Sql("SELECT * FROM booking").Find(&bookings.Data)
	res := common.Response{
		bookings.Data,
		http.StatusOK,
		http.StatusText(http.StatusOK),
	}
	return c.JSON(http.StatusOK, res)
}
