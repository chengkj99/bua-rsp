package product

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"net/http"

	"github.com/labstack/echo"
)

// Add for route of add
func Create(c echo.Context) error {
	var prouct Product
	engine := db.Engine

	// 获取请求的数据
	c.Bind(&prouct)

	// Insert 数据
	affected, err := engine.Insert(&prouct)
	common.CheckErr(err)

	return c.JSON(http.StatusOK, Response{Code: 200, Message: "ok", Data: affected})
}
