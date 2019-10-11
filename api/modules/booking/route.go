package booking

import (
	"github.com/labstack/echo"
)

// Route 预定管理路由
// 前缀 /booking
func Route(rg *echo.Group) {
	// 获取预约列表 /list？id=1&pid=2
	rg.GET("/list", GetList)
	rg.GET("/list/user/:id", GetListByUID)
	rg.GET("/list/publisher/:id", GetListByPublisherID)
	rg.GET("/list/product/:id", GetListByProductID)

	// 新增预约
	rg.POST("/add", Create)
	// 更新预约信息 & 审核预约
	rg.PUT("/:id", Update)
}
