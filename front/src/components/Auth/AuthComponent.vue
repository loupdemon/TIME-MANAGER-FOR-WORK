<template>
  <div :style="{'background-image':'url(https://cdn.discordapp.com/attachments/652102810933919746/909195527902609418/time.png'}">
  <div class="grid-container">
    <main class="center py-8 lg:px-64">
      <div class="p-4">
        <div  class="mt-4 bg-white rounded shadow font-semibold hover:shadow-md">
            <div class="login__container">
              <!--img class="w-96 my-8 self-center" src="../../assets/logo2.png" /-->
              <h3 class="view-title text-center">{{ isLogin ? 'Login' : 'Forgot your password?'}}</h3>
              
              <div class="login__content" v-if="isLogin">
                 <img class="w-96 my-8 self-center" src="../../assets/Time_Manager_blue.gif" />

                <div class="login__input__container">
                  <span class="login__label">Email:</span>
                  <input v-model="user.email" v-if="isLogin" type="text" class="login__input"/>
                </div>

                <div class="login__input__container">
                  <span class="login__label">Password:</span>
                  <input v-model="user.password" type="password" class="login__input"/>
                  <router-link @click="toggle" v-if="isLogin" to="/recover" class="text-sm mt-1 text-red-500 pointer hover:text-blue-600">Forgot your password?</router-link>
                </div>
              

                <button @click="login" v-if="isLogin" class="app-button bg-blue-500 text-white hover:bg-blue-700 active:bg-blue-800">Login</button>
              </div>

              <div v-else>
                      <div class="flex flex-col justify-center ">
                      <img class="w-96 my-8 self-center" src="../../assets/mail.gif" />
                      </div>
                      <form ref="form" @submit.prevent="sendEmail">
                            <div  class="login__label"><label>Name</label></div>
                            <div class="login__input__container"> 
                            <input class="login__input" type="text" id="name" name="name"  placeholder="Votre nom et prenom *" autoComplete="off"
                                        required ></div>
                            <div  class="login__label"><label>Team</label></div>
                            <div class="login__input__container"> 
                            <input class="login__input" type="text" id="team" name="team" placeholder="Votre team *" autoComplete="off"
                                        required ></div>
                            <div  class="login__label"><label>Email</label></div>
                            <div class="login__input__container"> 
                            <input class="login__input" id="email" type="email" placeholder="votre adresse pro" autoComplete="off"
                                        required></div>
                            <div  class="login__label"><label >Message</label></div>
                            <div class="login__input__container"> 
                            <textarea class="login__input" name="message" placeholder="Votre message *"
                                        required></textarea></div>
                            <div class="login__content">
                            <button type="submit" value="Send" class="app-button bg-blue-500 text-white hover:bg-blue-700 active:bg-blue-800"> Send</button>
                            <button @click="toggle" class="app-button bg-gray-500 text-white hover:bg-gray-600 active:bg-gray-700"> Back to login </button>
                            </div>
                        </form>
                  
              </div>
            </div>

            <teleport to="body">
              <vue3-snackbar bottom :duration="5000"/>
            </teleport>
        </div>
      </div>
    </main>
  </div>
  </div>

</template>

<script>
import Api from '../../api'
import emailjs from 'emailjs-com';

export default {
  name: "LoginComponent",
  methods: {
    sendEmail() {
      emailjs.sendForm('service_wid1wl4', 'template_kiv1pzb', this.$refs.form, 'user_4fwpToohASWJK3M7k0Ky1')
        .then((result) => {
            console.log('SUCCESS!', result.text);
        }, (error) => {
            console.log('FAILED...', error.text);
        });
    },
    toggle() {
      this.isLogin = !this.isLogin
    },
    async login() {
      const loggedUser = await Api.login(this.user.email, this.user.password)
      if (loggedUser) {
        localStorage.setItem("user", JSON.stringify(loggedUser))
        this.$snackbar.add({
          type: 'success',
          text: 'Login successful. Redirecting ...'
        })
        this.$router.go()
      } else {
        this.$snackbar.add({
          type: 'error',
          text: 'Wrong credentials, please try again.'
        })
      }
    }
  },
  data() {
    return {
      error: false,
      isLogin: true,
      user : {
        username: '',
        email: '',
        password: '',
        confirmPassword: ''
      }
    }
  }
}
</script>

<style scoped>

</style>