package booking

import (
	"net/http"

	"github.com/labstack/echo"
)

func Route(rg *echo.Group) {
	// 获取预约列表
	rg.GET("/list", GetList)
	// 新增预约
	rg.POST("/add", Create)
	// 更新预约信息
	rg.PUT("/update", func(c echo.Context) error {
		return c.String(http.StatusOK, "update Booking Info")
	})
}
