// 我的发布-列表展示
<template>
  <div class="user-product-list">
    <table-page :data="localValue">
      <el-table-column label="图片">
        <template slot-scope="scope">
          <el-upload
            class="avatar-uploader"
            :action="'/api/product/upload/' + scope.row.id"
            :show-file-list="false"
            :on-success="(res, file) => handleAvatarSuccess(res, file, scope.row.id)"
          >
            <img
              v-if="scope.row.img_url"
              :src="`${imgDomainName}/${scope.row.img_url}`"
              class="avatar"
            />
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
        </template>
      </el-table-column>
      <el-table-column label="名称">
        <template slot-scope="scope">{{ scope.row.name }}</template>
      </el-table-column>
      <el-table-column label="厂商型号">
        <template slot-scope="scope">{{ scope.row.firm_model }}</template>
      </el-table-column>
      <el-table-column label="性能参数" width="280">
        <template slot-scope="scope">
          <el-input
            type="textarea"
            readonly
            :autosize="{ minRows: 2, maxRows: 4}"
            v-model="scope.row.parameter"
          ></el-input>
        </template>
      </el-table-column>
      <el-table-column label="状态">
        <template slot-scope="scope">
          <el-tag :type="statusesStyle[scope.row.status]">{{ statusNameMap[scope.row.status] }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="计费">
        <template slot-scope="scope">
          <price-tag :priceType="scope.row.price_type" :priceValue="scope.row.price_value"></price-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="180">
        <template slot-scope="scope">
          <el-button size="mini" type="danger" plain @click="handleDelete(scope.row)">删除</el-button>
          <el-button size="mini" type="primary" plain @click="setPrice(scope.row)">计费设置</el-button>
        </template>
      </el-table-column>
    </table-page>
  </div>
</template>

<script>
import TablePage from "@/components/common/table-page";
import PriceTag from "@/components/common/price-tag";
import {
  statusNameMap,
  statusesStyle,
  imgDomainName
} from "@/constants/product";
import { priceTypes, priceTypeNameMap } from "@/constants/product";

export default {
  name: "user-product-list",
  props: ["value"],
  components: {
    TablePage,
    PriceTag
  },
  data() {
    return {
      priceTypes,
      priceTypeNameMap,
      statusNameMap,
      statusesStyle,
      dialogVisible: false,
      dialogImageUrl: "",
      imgDomainName,
      localValue: []
    };
  },
  watch: {
    value: {
      handler(value) {
        this.localValue = value.map(obj => ({ ...obj }));
      }
    },
    immediuate: true,
    deep: true
  },
  methods: {
    edit(row) {
      console.log("edit...");
    },
    handleAvatarSuccess(res, file, id) {
      setTimeout(() => {
        this.localValue = this.localValue.map(item => {
          if (item.id === id) {
            return {
              ...item,
              img_url: file.name
            };
          }
          return item;
        });
      }, 500);

      // this.imageUrl = URL.createObjectURL(file.raw);
    },
    // beforeAvatarUpload(file) {
    //   const isJPG = file.type === 'image/jpeg';
    //   const isLt2M = file.size / 1024 / 1024 < 2;

    //   // if (!isJPG) {
    //   //   this.$message.error('上传头像图片只能是 JPG 格式!');
    //   // }
    //   if (!isLt2M) {
    //     this.$message.error('上传头像图片大小不能超过 2MB!');
    //   }
    //   return isJPG && isLt2M;
    // },
    handleDelete(row) {
      this.$confirm("此操作将删除该产品, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.$emit("delete", row.id);
      });
    },
    setPrice(row) {
      console.log("&&&", row);
      this.$emit("set-price", row);
    }
  }
};
</script>

<style lang='less' scoped>
.user-product-list {
  position: relative;
  display: block;

  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409eff;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 136px;
    height: 136px;
    display: block;
  }
}
</style>
