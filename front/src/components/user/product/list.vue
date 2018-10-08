// 我的发布-列表展示
<template>
  <div class='user-product-list'>
    <table-page :data="value">
      <el-table-column label="图片">
        <template slot-scope="scope">
          <span v-if="scope.row.img_url != ''">{{ scope.row.img_url }}</span>
          <span v-else>
            <el-upload
              :action="'/api/product/upload/' + scope.row.id"
              list-type="picture-card"
              :on-preview="handlePictureCardPreview"
              :on-remove="handleRemove">
              <i class="el-icon-plus"></i>
            </el-upload>
            <el-dialog :visible.sync="dialogVisible">
              <img width="100%" :src="dialogImageUrl" alt="">
            </el-dialog>
          </span>
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
      dialogImageUrl: ''
    }
  },
  methods: {
    edit(row) {
      console.log('edit...')
    },
    handleRemove(file, fileList) {
      console.log(file, fileList);
    },
    handlePictureCardPreview(file) {
      console.log('file...', file)
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    }
  },
}
</script>

<style lang='less' scoped>
.user-product-list {
  position: relative;
  display: block;
}
</style>
