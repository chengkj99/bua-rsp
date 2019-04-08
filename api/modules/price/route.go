package price

import (
	"github.com/labstack/echo"
)

// Route 价格管理
// 前缀 /price
// TODO DELETE
func Route(rg *echo.Group) {
	// 获取价格
	rg.GET("/:id", GetPriceById)
	// 新增预约
	rg.POST("/add", Create)
	// 更新产品价格
	rg.PUT("/:id", Update)
}
