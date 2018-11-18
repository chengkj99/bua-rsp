package product

import (
	"bua-rsp/api/modules/common"
	"bytes"
	"fmt"
	"io/ioutil"
	"strconv"

	"github.com/labstack/echo"
	"github.com/qiniu/api.v7/auth/qbox"
	"github.com/qiniu/api.v7/storage"
	"golang.org/x/net/context"
)

type UploadResponse struct {
	Key  string
	Hash string
}

func Upload(c echo.Context) error {

	// Source File
	file, err := c.FormFile("file")
	if err != nil {
		return err
	}
	src, err := file.Open()
	if err != nil {
		return err
	}
	defer src.Close()

	localFile, _ := ioutil.ReadAll(src)

	key := file.Filename

	bucket := "bua-rsp"
	accessKey := "cR_vouobzvgLTBWcVqTBT8UVkJQSWu5fSLcuc_e3"
	secretKey := "8NgfIbhDB1Wp_0uuTQ5THRWMQOcmbixilZC8wmHs"

	putPolicy := storage.PutPolicy{
		Scope: bucket,
	}
	mac := qbox.NewMac(accessKey, secretKey)
	upToken := putPolicy.UploadToken(mac)

	cfg := storage.Config{}
	// 空间对应的机房
	cfg.Zone = &storage.ZoneHuabei
	// 是否使用https域名
	cfg.UseHTTPS = false
	// 上传是否使用CDN上传加速
	cfg.UseCdnDomains = false
	//  构建表单上传的对象
	formUploader := storage.NewFormUploader(&cfg)
	ret := storage.PutRet{}
	putExtra := storage.PutExtra{
		Params: map[string]string{
			"x:name": "github logo",
		},
	}
	dataLen := int64(len(localFile))
	err = formUploader.Put(context.Background(), &ret, upToken, key, bytes.NewReader(localFile), dataLen, &putExtra)
	if err != nil {
		fmt.Println(err)
		return err
	}
	fmt.Println(ret.Key, ret.Hash)
	// 同步修改产品 img_url 的信息
	id, _ := strconv.Atoi(c.Param("id"))
	affected, err := UpdateProductImgUrl(c, id, ret.Key)
	if err != nil {
		return c.JSON(200, common.Response{Code: 50001, Message: "更新数据库错误", Data: affected})
	}

	return c.JSON(200, common.Response{Code: 200, Message: "ok", Data: UploadResponse{ret.Key, ret.Hash}})
}
