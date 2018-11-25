package product

import (
	"github.com/labstack/echo"
)

// Route 产品管理路由
// 前缀 /product
func Route(rg *echo.Group) {
	// 获取产品列表
	rg.GET("/list", GetList)
	// 根据 ID 获取产品
	rg.GET("/list/:id", GetListByID)

	// 根据 publisherId 查询产品
	rg.GET("/list/publisher/:id", GetListByPublisherID)

	// 新建产品
	rg.POST("/add", Create)

	// 删除产品
	rg.DELETE("/:id", Delete)

	// 修改线路信息
	rg.PUT("/:id", Update)

	// 修改产品可用性状态 enable, disable
	rg.PUT("/status/:id", UpdateStatus)

	// 上传图片
	rg.POST("/upload/:id", Upload)
}
