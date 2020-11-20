<template>
<!--  <v-app id="inspire">-->
<!--    <v-navigation-drawer-->
<!--        v-model="drawer"-->
<!--        app-->
<!--        class="pt-4"-->
<!--        color="grey lighten-3"-->
<!--        mini-variant-->
<!--    >-->
<!--      <v-avatar-->
<!--          v-for="n in 6"-->
<!--          :key="n"-->
<!--          :color="`grey ${n === 1 ? 'darken' : 'lighten'}-1`"-->
<!--          :size="n === 1 ? 36 : 20"-->
<!--          class="d-block text-center mx-auto mb-9"-->
<!--      ></v-avatar>-->
<!--    </v-navigation-drawer>-->

<!--    <v-main>-->
<!--      &lt;!&ndash;  &ndash;&gt;-->
<!--    </v-main>-->
<!--  </v-app>-->
  <v-app>
    <v-navigation-drawer app v-model="drawer">
      <!--  -->
    </v-navigation-drawer>
    <v-app-bar app>
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

      <v-toolbar-title>Application</v-toolbar-title>
    </v-app-bar>

    <v-main>
      <div>
        <v-card>
          <v-responsive :aspect-ratio="16/9">
            <v-card-text>
              <div>
                <v-data-table
                    :headers="headers"
                    :items="items"
                    :page.sync="page"
                    :items-per-page="itemsPerPage"
                    hide-default-footer
                    class="elevation-1"
                    @page-count="pageCount = $event"
                ></v-data-table>
                <div class="text-center pt-2">
                  <v-pagination
                      v-model="page"
                      :length="pageCount"
                  ></v-pagination>
<!--                  <v-text-field-->
<!--                      :value="itemsPerPage"-->
<!--                      label="Items per page"-->
<!--                      type="number"-->
<!--                      min="-1"-->
<!--                      max="15"-->
<!--                      @input="itemsPerPage = parseInt($event, 10)"-->
<!--                  ></v-text-field>-->
                </div>
              </div>
            </v-card-text>
          </v-responsive>
        </v-card>
      </div>
    </v-main>
    <v-footer app>
      <!-- -->
    </v-footer>
  </v-app>
</template>

<script>
import axios from 'axios'

export default {
  data: function () {
    return {
      message: "Hello Vue!",
      drawer: null,
      page: 1,
      pageCount: 0,
      itemsPerPage: 20,
      headers: [
        {
          text: 'Title',
          align: 'start',
          sortable: false,
          value: 'name',
        },
        { text: 'Location', value: 'location' },
        { text: '30 day occupancy rate', value: 'occupancy_rate' },
        { text: '30 day average daily rate', value: 'average_daily_rate' },
      ],
      items: [],
    }
  },
  mounted() {
    axios.get('/api/listings').then(response => (this.items = response.data));
  }
}
</script>

<!--<style scoped>-->
<!--p {-->
<!--  font-size: 2em;-->
<!--  text-align: center;-->
<!--}-->
<!--</style>-->
