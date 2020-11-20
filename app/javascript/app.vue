<template>
  <v-app>
    <v-navigation-drawer class="px-5" app v-model="drawer">
      <v-list>
        <v-list-item class="px-2">
          <v-avatar color="indigo">
            <v-icon dark>
              mdi-account-circle
            </v-icon>
          </v-avatar>
        </v-list-item>
        <v-list-item link>
          <v-list-item-content>
            <v-list-item-title class="title">
              {{ this.user.u_key }}
            </v-list-item-title>
            <v-list-item-subtitle>
              {{ this.user.email }}
            </v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>
      </v-list>
      <template v-slot:append>
        <div class="pa-2">
          <v-btn block @click="logout">
            Logout
          </v-btn>
        </div>
      </template>
    </v-navigation-drawer>

    <v-app-bar app>
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>Application</v-toolbar-title>
    </v-app-bar>

    <v-main app>
      <v-overlay v-if="loading">
        <v-progress-circular
            :size="70"
            :width="7"
            color="primary"
            indeterminate
        ></v-progress-circular>
      </v-overlay>

      <div>
        <v-alert dense border="left" type="warning" v-if="error">
          {{ this.error }}
        </v-alert>
        <v-card>
          <v-responsive>
            <v-card-text>
              <v-text-field
                  v-model="urlString"
                  label="Please, paste Airbnb listing url"
                  @input="urlHandler"
              ></v-text-field>
            </v-card-text>
          </v-responsive>
        </v-card>
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
                <div class="text-center pt-2" v-if="items.length > itemsPerPage">
                  <v-pagination
                      v-model="page"
                      :length="pageCount"
                  ></v-pagination>
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
      drawer: null,
      error: null,
      loading: false,
      currentListing: null,
      page: 1,
      pageCount: 0,
      itemsPerPage: 10,
      urlString: null,
      user: {},
      headers: [
        {
          text: 'Title',
          align: 'start',
          sortable: false,
          value: 'name',
        },
        { text: 'Abnb Id', value: 'uid', sortable: false },
        { text: 'Location', value: 'location', sortable: false },
        { text: '30 day occupancy rate', value: 'occupancy_rate', sortable: false },
        { text: '30 day average daily rate', value: 'average_daily_rate', sortable: false },
        { text: 'Last parsing', value: 'updated_at', sortable: false },
      ],
      items: [],
    }
  },
  methods: {
    urlHandler: function(value){
      this.loading = true
      axios.post('/api/listings', { url: value }).then(function(response){
        this.errorHandler(response.data);
        if(!this.error) this.items.unshift(response.data);
        this.setDefaultState()
      }.bind(this)).catch(function (error) {
        this.setDefaultState()
        this.error = 'Something went wrong!'
      }.bind(this));
    },
    logout(){
      axios.delete('/user/sign_out').catch(function (error) { window.location.href = '/'; });
    },
    setDefaultState(){
      this.urlString = null;
      this.loading = false;
    },
    errorHandler(data) {
      if(!data.uid) this.error = 'Pls, check that listing is available on Airbnb!'
      if(data.error) this.error = data.error;
      if(this.error) setTimeout(function(){ this.error = null }.bind(this), 2000)
    }
  },
  mounted() {
    axios.get('/api/listings').then(response => (this.items = response.data));
    axios.get('/api/users').then(response => (this.user = response.data));
  }
}
</script>
