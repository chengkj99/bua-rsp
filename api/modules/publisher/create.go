package publisher

import (
	"bua-rsp/api/db"
	"bua-rsp/api/modules/common"
	"net/http"

	"github.com/labstack/echo"
)

// Create for route of add
func Create(c echo.Context) error {
	var publisher Publisher
	engine := db.Engine

	// 获取请求的数据
	c.Bind(&publisher)

	// Insert 数据
	// affected 的含义是，影响了多少行数据
	affected, err := engine.Insert(&publisher)
	common.CheckErr(err)

	return c.JSON(http.StatusOK, common.Response{Code: 200, Message: "ok", Data: affected})
}
