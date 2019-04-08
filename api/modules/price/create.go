package price

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"net/http"

	"github.com/labstack/echo"
)

// Create 预约，仅限普通用户预约
func Create(c echo.Context) error {
	var price Price
	engine := db.Engine

	c.Bind(&price)

	affected, err := engine.Insert(&price)
	common.CheckErr(err)
	return c.JSON(http.StatusOK, common.Response{Code: 200, Message: "ok", Data: affected})
}
