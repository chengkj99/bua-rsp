package product

import (
	"bua-rsp/api/modules/common"
	"fmt"
	"os"
	"strconv"

	"github.com/aliyun/aliyun-oss-go-sdk/oss"
	"github.com/labstack/echo"
)

func UploadForAli(c echo.Context) error {

	endpoint := "oss-cn-beijing.aliyuncs.com"
	accessKey := "LTAIp8PDVMlzwM6X"
	accessKeySecret := "nzBbW7bf2cfiq5thKxZlQSQvHlxZ5S"
	bucketName := "ckj-bucket"

	// 创建OSSClient实例。
	client, err := oss.New(endpoint, accessKey, accessKeySecret)
	if err != nil {
		fmt.Println("Error:", err)
		os.Exit(-1)
	}

	// 获取存储空间。
	bucket, err := client.Bucket(bucketName)
	if err != nil {
		fmt.Println("Error:", err)
		os.Exit(-1)
	}

	// 读取文件。
	file, err := c.FormFile("file")
	if err != nil {
		return err
	}
	src, err := file.Open()
	if err != nil {
		return err
	}
	defer src.Close()

	fileName := file.Filename
	objectName := "bua-rsp/" + fileName
	// 上传文件流
	err = bucket.PutObject(objectName, src)
	if err != nil {
		fmt.Println("Error:", err)
		os.Exit(-1)
	}

	// 同步修改产品 img_url 的信息
	id, _ := strconv.Atoi(c.Param("id"))
	affected, err := UpdateProductImgUrl(c, id, fileName)
	if err != nil {
		return c.JSON(200, common.Response{Code: 50001, Message: "更新数据库错误", Data: affected})
	}
	fmt.Print(src)

	return c.JSON(200, common.Response{Code: 200, Message: "ok", Data: UploadResponse{fileName, id}})
}
