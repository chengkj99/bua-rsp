<template>
  <div class="publisher-audit">
    <audit-list :value="value" @approve="hanldeApprove" @reject="handleReject"></audit-list>
  </div>
</template>

<script>
import { isEmpty } from 'lodash'
import { getPublisherBookingList } from "@/apis/booking";
import { updateBooing } from "@/apis/booking";
import AuditList from "./list";
import userStore from "@/stores/user.js";

export default {
  nanm: "publisher-audit",
  components: {
    AuditList
  },
  data() {
    return {
      value: []
    };
  },
  fromMobx: {
    publisherId() {
      return userStore.uid;
    }
  },
  mounted() {
    this.$watch(
      "publisherId",
      value => {
        value && this.fetch(value);
      },
      { immediate: true }
    );
  },
  methods: {
    fetch(publisherId) {
      getPublisherBookingList(publisherId).then(data => {
        if (isEmpty(data)) {
          return;
        }
        this.value = data
      });
    },
    doAudit(value, successText) {
      updateBooing(value).then(
        () => {
          this.$message.success(successText);
          this.fetch(this.publisherId);
        },
        () => {
          this.$message.danger("审核失败");
        }
      );
    },
    hanldeApprove(value) {
      this.doAudit(value, "已审核通过");
    },
    handleReject(value) {
      this.doAudit(value, "已审核拒绝");
    }
  }
};
</script>

<style lang='less' scoped>
.publisher-audit {
  position: relative;
  display: block;
}
</style>
