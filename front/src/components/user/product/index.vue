<template>
  <div class="user-product">
    <div class="opreater">
      <el-button
        size="small"
        type="primary"
        icon="el-icon-circle-plus-outline"
        @click="openDialogOfAddUserProduct"
        plain
      >新增产品</el-button>
    </div>
    <product-list :value="userProduct" @delete="handleDelete" @set-price="handleSetPrice"></product-list>

    <el-dialog title="新增产品" :visible.sync="dialogFormVisible">
      <product-form @submit="handleSubmit" @cancel="dialogFormVisible = false"></product-form>
    </el-dialog>
    <el-dialog title="更新计费规则" :visible.sync="dialogPriceFormVisible">
      <price-form
        :value="currentProduct"
        @submit="handleSubmitPriceForm"
        @cancel="dialogPriceFormVisible = false"
      ></price-form>
    </el-dialog>
  </div>
</template>

<script>
import { getPublisherProduct } from "@/apis/user";
import { addProduct, deleteProduct, updateProduct } from "@/apis/product";
import ProductList from "./list";
import ProductForm from "./form";
import PriceForm from "./price-form";
import userStore from "@/stores/user";

export default {
  name: "user-product",
  components: {
    ProductList,
    ProductForm,
    PriceForm
  },
  data() {
    return {
      userProduct: [],
      dialogFormVisible: false,
      dialogPriceFormVisible: false,
      // TODO UPDATE
      // uid: 1,
      currentProduct: {}
    };
  },
  fromMobx: {
    uid() {
      return userStore.uid;
    }
  },
  // created() {
  //   console.log("##", this.uid); // TODO
  //   this.getPublisherProduct(this.uid);
  // },
  watch: {
    uid: {
      handler(value) {
        if (value) {
          this.getPublisherProduct(value);
        }
      },
      immediate: true
    }
  },
  methods: {
    getPublisherProduct(uid) {
      getPublisherProduct(uid).then(data => (this.userProduct = data));
    },
    openDialogOfAddUserProduct() {
      this.dialogFormVisible = true;
    },
    handleSubmit(value) {
      const _value = { ...value, uid: this.uid };
      addProduct(_value).then(
        () => {
          this.$message.success("添加成功");
          this.dialogFormVisible = false;
          this.getPublisherProduct(this.uid);
        },
        () => {
          this.$message.error("添加失败");
        }
      );
    },
    handleDelete(id) {
      deleteProduct(id).then(
        () => {
          this.$message.success("删除成功");
          this.getPublisherProduct(this.uid);
        },
        () => {
          this.$message.error("删除失败");
        }
      );
    },
    handleSetPrice(product) {
      this.currentProduct = { ...product };
      this.dialogPriceFormVisible = true;
    },
    handleSubmitPriceForm(value) {
      updateProduct(value).then(
        res => {
          this.getPublisherProduct(this.uid);
          this.dialogPriceFormVisible = false;
        },
        err => {
          this.$message.error("更新失败，请重试");
        }
      );
    }
  }
};
</script>

<style lang='less' scoped>
.user-product {
  position: relative;
  display: block;

  .opreater {
    height: 40px;
    line-height: 40px;
    padding: 10px 0;
    text-align: right;
  }
}
</style>
