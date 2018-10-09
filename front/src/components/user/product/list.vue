// 我的发布-列表展示
<template>
  <div class='user-product-list'>
    <table-page :data="localValue">
      <el-table-column label="图片">
        <template slot-scope="scope">
          <el-upload
            class="avatar-uploader"
            :action="'/api/product/upload/' + scope.row.id"
            :show-file-list="false"
            :on-success="(res, file) => handleAvatarSuccess(res, file, scope.$index)"
            :before-upload="beforeAvatarUpload">
            <img v-if="scope.row.img_url" :src="`${imgDomainName}/${scope.row.img_url}`" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
        </template>
      </el-table-column>
      <el-table-column label="名称">
        <template slot-scope="scope">
           {{ scope.row.name }}
        </template>
      </el-table-column>
      <el-table-column label="厂商型号">
        <template slot-scope="scope">
           {{ scope.row.firm_model }}
        </template>
      </el-table-column>
      <el-table-column label="性能参数">
        <template slot-scope="scope">
           {{ scope.row.parameter }}
        </template>
      </el-table-column>
      <el-table-column label="状态">
        <template slot-scope="scope">
          <el-tag :type="statusesStyle[scope.row.status]">
            {{ statusNameMap[scope.row.status] }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button
            size="mini"
            @click="edit(scope.row)">
            编辑
          </el-button>
        </template>
      </el-table-column>
    </table-page>
  </div>
</template>

<script>
import TablePage from '@/components/common/table-page'
import { statusNameMap, statusesStyle } from '@/constants/product'

const imgDomainName = 'http://pg896kvfn.bkt.clouddn.com'

export default {
  name: 'user-product-list',
  props: ['value'],
  components: {
    TablePage
  },
  data() {
    return {
      statusNameMap,
      statusesStyle,
      dialogVisible: false,
      dialogImageUrl: '',
      imgDomainName,
      localValue: []
    }
  },
  watch: {
    value: {
      handler(value) {
        this.localValue = value.map(obj => ({ ...obj }))
      }
    },
    immediuate: true,
    deep: true
  },
  methods: {
    edit(row) {
      console.log('edit...')
    },
    handleAvatarSuccess(res, file, index) {
      this.localValue[index].img_url = file.name
      // this.imageUrl = URL.createObjectURL(file.raw);
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg';
      const isLt2M = file.size / 1024 / 1024 < 2;

      // if (!isJPG) {
      //   this.$message.error('上传头像图片只能是 JPG 格式!');
      // }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isJPG && isLt2M;
    }
  },
}
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
    border-color: #409EFF;
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
