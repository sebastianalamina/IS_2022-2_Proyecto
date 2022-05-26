<script setup>
import { defineEmits, reactive, watch } from "vue";

const emit = defineEmits();
const basic = reactive([]);

const toBase64 = (file) =>
  new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => resolve(reader.result);
    reader.onerror = (error) => reject(error);
  });

watch(basic, (files) => {
  if (files.length == 0) return;
  toBase64(files[0]).then((fileStr) => {
    emit("change", fileStr);
  });
});
// function upload(e, a) {
//   const files = e.target.files;
//   if (files.length == 0) return;
//   toBase64(files[0]).then((fileStr) => {
//     emit("change", fileStr);
//   });
// }
</script>
<template>
  <!-- <input type="file" accept="image/*" @change="upload" /> -->
  <va-file-upload v-model="basic" dropzone file-types=".jpg,.png" />
</template>
