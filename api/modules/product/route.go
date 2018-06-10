package product

import (
	"net/http"

	"github.com/labstack/echo"
)

// Route For product module
func Route(rg *echo.Group) {
	// 获取产品列表
	rg.GET("/list", GetList)

	// 新建产品
	rg.POST("/add", Create)

	// 修改线路
	rg.PUT("/update", func(c echo.Context) error {
		return c.String(http.StatusOK, " update product!")
	})
}
