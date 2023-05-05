<template>
          <nav class="fixed top-0 inset-x-0 z-50 h-16 text-white bg-gray-800 font-medium flex justify-between items-center shadow-lg">
            <!-- Extract: MobileMenu Vue component -->
            <div class="w-16 h-16 flex justify-center items-center text-gray-600 lg:hidden">
                <button class="p-1 hover:text-white" :class="{'text-white': isMenuOpen}" @click="this.setMenuOpen">
                    <svg class="fill-current w-10 h-10" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                        <path v-if="!this.isMenuOpen" d="M4 5h16a1 1 0 010 2H4a1 1 0 110-2zm0 6h16a1 1 0 010 2H4a1 1 0 010-2zm0 6h16a1 1 0 010 2H4a1 1 0 010-2z" />
                        <path v-else d="M16.24 14.83a1 1 0 0 1-1.41 1.41L12 13.41l-2.83 2.83a1 1 0 0 1-1.41-1.41L10.59 12 7.76 9.17a1 1 0 0 1 1.41-1.41L12 10.59l2.83-2.83a1 1 0 0 1 1.41 1.41L13.41 12l2.83 2.83z" />
                    </svg>
                </button>

                <transition enter-active-class="transition duration-200 ease-in-out transform" enter-class="-translate-x-full opacity-0" leave-active-class="transition duration-200 ease-in-out transform" leave-to-class="-translate-x-full opacity-0">
                    <div v-show="isMenuOpen" class="absolute inset-0 h-screen" @click="this.setMenuOpen">
                        <div ref="menu" class="mt-16 absolute inset-0 z-40 overflow-y-auto">
                            <div class="py-6 w-full min-h-full bg-gray-700">
                                <!-- Extract: user_info blade partial -->
                                <div class="px-6 pb-6 flex items-center border-b border-gray-100 sm:flex-col">
                                    <!--div class="hidden px-3 text-white text-base rounded-full border sm:block">myspace</div-->
                                    <div class="mr-auto text-white flex-shrink-0 flex justify-center items-center rounded-full  sm:mt-4 sm:mx-auto">
                                    
                                       
                                          <img class="object-cover w-10 h-10 rounded-full" :src="currentUser.photo" alt="Profile image"/>

                                        </div>
                                        
                                        <div class="ml-4 flex-1 flex flex-col lg:mt-4 lg:ml-0 lg:items-center">
                                            <div class="text-white text-2xl lg:hidden">Hello, </div>
                                            <div class="text-yellow-500 text-xl sm:text-sm userSidebar__greetings"><strong>{{ currentUser.username }}!</strong></div>
                                            <button @click="logout" class="userSidebar__logout w-40">Logout</button>
                                        
                                        </div>
                                </div>

                                <!-- Extract: menu_items -->
                                <div class="mt-4">
                                    <!-- TODO: add group here and group-hover to the shevron icon to show it only when the group is hovered -->
                                    <div class="sidebar__link">

                                        <router-link to="/" > <a class="px-10 flex items-center text-xl text-gray-100 hover:text-orange-500 sm:px-4 sm:text-base">
                                                <div class="ml-6 flex-1 sm:ml-4 ">
                                                <span >Overview</span>
                                                </div>
                                            <svg class="fill-current w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M9.3 8.7a1 1 0 011.4-1.4l4 4a1 1 0 010 1.4l-4 4a1 1 0 01-1.4-1.4l3.29-3.3-3.3-3.3z" /></svg>
                                        </a></router-link>
                                    </div>

                                    <div class="sidebar__link">
                                        <!--items -->
                                         <router-link to="/profile" ><a class="px-10 flex items-center text-xl text-gray-100 hover:text-orange-500 sm:px-4 sm:text-base">
                                            <div class="ml-6 flex-1 sm:ml-4">
                                                <span >Profile</span>
                                                </div>
                                            <svg class="fill-current w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M9.3 8.7a1 1 0 011.4-1.4l4 4a1 1 0 010 1.4l-4 4a1 1 0 01-1.4-1.4l3.29-3.3-3.3-3.3z" /></svg>
                                        </a></router-link>
                                    </div>

                                    <span class="sidebar__category">Manage my work</span>

                                    <div class="sidebar__link">
                                    <!--items -->
                                    <router-link to="/attendance" ><a class="px-10 flex items-center text-xl text-gray-100 hover:text-orange-500 sm:px-4 sm:text-base">
                                            <div class="ml-6 flex-1 sm:ml-4">
                                                    <span>Attendance</span>
                                                </div>

                                            <svg class="fill-current w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M9.3 8.7a1 1 0 011.4-1.4l4 4a1 1 0 010 1.4l-4 4a1 1 0 01-1.4-1.4l3.29-3.3-3.3-3.3z" /></svg>
                                        </a></router-link>
                                    </div>

                                    <div class="sidebar__link">
                                    <!--items -->
                                        <router-link to="/colleagues"><a class="px-10 flex items-center text-xl text-gray-100 hover:text-orange-500 sm:px-4 sm:text-base">
                                            <div class="ml-6 flex-1 sm:ml-4">
                                                   <span>My colleagues</span>
                                                </div>

                                            <svg class="fill-current w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M9.3 8.7a1 1 0 011.4-1.4l4 4a1 1 0 010 1.4l-4 4a1 1 0 01-1.4-1.4l3.29-3.3-3.3-3.3z" /></svg>
                                        </a></router-link>
                                    </div>

                                    <div class="sidebar__link">
                                        <!--items -->
                                        <router-link to="/schedule"><a class="px-10 flex items-center text-xl text-gray-100 hover:text-orange-500 sm:px-4 sm:text-base">
                                            <div class="ml-6 flex-1 sm:ml-4">
                                                    <span>My schedule</span>
                                                </div>
                                            <svg class="fill-current w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M9.3 8.7a1 1 0 011.4-1.4l4 4a1 1 0 010 1.4l-4 4a1 1 0 01-1.4-1.4l3.29-3.3-3.3-3.3z" /></svg>
                                        </a></router-link>
                                    </div>
                                            <!--    <router-link to="/timeoff" class="sidebar__link">Request time-off</router-link>-->

                                        <span class="sidebar__category">Manage my employees</span>

                                    <!--items -->
                                    <div class="sidebar__link">
                                        <router-link to="/employees"><a class="px-10 flex items-center text-xl text-gray-100 hover:text-orange-500 sm:px-4 sm:text-base">
                                            <div class="ml-6 flex-1 sm:ml-4">
                                                    <span>Employees</span>
                                                </div>

                                            <svg class="fill-current w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M9.3 8.7a1 1 0 011.4-1.4l4 4a1 1 0 010 1.4l-4 4a1 1 0 01-1.4-1.4l3.29-3.3-3.3-3.3z" /></svg>
                                        </a></router-link>
                                    </div>

                                        <!--items -->
                                        <div class="sidebar__link">
                                        <router-link to="/team/all"><a class="px-10 flex items-center text-xl text-gray-100 hover:text-orange-500 sm:px-4 sm:text-base">
                                            <div class="ml-6 flex-1 sm:ml-4">
                                                    <span>Teams</span>
                                                </div>

                                            <svg class="fill-current w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M9.3 8.7a1 1 0 011.4-1.4l4 4a1 1 0 010 1.4l-4 4a1 1 0 01-1.4-1.4l3.29-3.3-3.3-3.3z" /></svg>
                                        </a></router-link>
                                        </div>

                                </div>

                                  <div >
                                    <div class="text-gray-500 px-10 mt-5">
                                       <div class="mt-2">© Copyright 2021. All Rights Reserved.</div>
                                                <!--logo social network-->
                                        <div class="md:flex-auto md:flex-row-reverse mt-2 flex-row flex">
                                        <a href="/#" class="w-6 mx-1">
                                            <svg class="fill-current cursor-pointer text-gray-500 hover:text-gray-400" width="100%" height="100%" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/" style="fill-rule: evenodd; clip-rule: evenodd; stroke-linejoin: round; stroke-miterlimit: 2;">
                                            <path id="Facebook" d="M24,12c0,6.627 -5.373,12 -12,12c-6.627,0 -12,-5.373 -12,-12c0,-6.627
                                                5.373,-12 12,-12c6.627,0 12,5.373
                                                12,12Zm-11.278,0l1.294,0l0.172,-1.617l-1.466,0l0.002,-0.808c0,-0.422
                                                0.04,-0.648 0.646,-0.648l0.809,0l0,-1.616l-1.295,0c-1.555,0 -2.103,0.784
                                                -2.103,2.102l0,0.97l-0.969,0l0,1.617l0.969,0l0,4.689l1.941,0l0,-4.689Z"></path>
                                            </svg>
                                        </a>
                                        <a href="/#" class="w-6 mx-1">
                                            <svg class="fill-current cursor-pointer text-gray-500 hover:text-gray-400" width="100%" height="100%" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/" style="fill-rule: evenodd; clip-rule: evenodd; stroke-linejoin: round; stroke-miterlimit: 2;">
                                            <path id="Shape" d="M7.3,0.9c1.5,-0.6 3.1,-0.9 4.7,-0.9c1.6,0 3.2,0.3 4.7,0.9c1.5,0.6 2.8,1.5
                                                3.8,2.6c1,1.1 1.9,2.3 2.6,3.8c0.7,1.5 0.9,3 0.9,4.7c0,1.7 -0.3,3.2
                                                -0.9,4.7c-0.6,1.5 -1.5,2.8 -2.6,3.8c-1.1,1 -2.3,1.9 -3.8,2.6c-1.5,0.7
                                                -3.1,0.9 -4.7,0.9c-1.6,0 -3.2,-0.3 -4.7,-0.9c-1.5,-0.6 -2.8,-1.5
                                                -3.8,-2.6c-1,-1.1 -1.9,-2.3 -2.6,-3.8c-0.7,-1.5 -0.9,-3.1 -0.9,-4.7c0,-1.6
                                                0.3,-3.2 0.9,-4.7c0.6,-1.5 1.5,-2.8 2.6,-3.8c1.1,-1 2.3,-1.9
                                                3.8,-2.6Zm-0.3,7.1c0.6,0 1.1,-0.2 1.5,-0.5c0.4,-0.3 0.5,-0.8 0.5,-1.3c0,-0.5
                                                -0.2,-0.9 -0.6,-1.2c-0.4,-0.3 -0.8,-0.5 -1.4,-0.5c-0.6,0 -1.1,0.2
                                                -1.4,0.5c-0.3,0.3 -0.6,0.7 -0.6,1.2c0,0.5 0.2,0.9 0.5,1.3c0.3,0.4 0.9,0.5
                                                1.5,0.5Zm1.5,10l0,-8.5l-3,0l0,8.5l3,0Zm11,0l0,-4.5c0,-1.4 -0.3,-2.5
                                                -0.9,-3.3c-0.6,-0.8 -1.5,-1.2 -2.6,-1.2c-0.6,0 -1.1,0.2 -1.5,0.5c-0.4,0.3
                                                -0.8,0.8 -0.9,1.3l-0.1,-1.3l-3,0l0.1,2l0,6.5l3,0l0,-4.5c0,-0.6 0.1,-1.1
                                                0.4,-1.5c0.3,-0.4 0.6,-0.5 1.1,-0.5c0.5,0 0.9,0.2 1.1,0.5c0.2,0.3 0.4,0.8
                                                0.4,1.5l0,4.5l2.9,0Z"></path>
                                            </svg>
                                        </a>
                                        <a href="/#" class="w-6 mx-1">
                                            <svg class="fill-current cursor-pointer text-gray-500 hover:text-gray-400" width="100%" height="100%" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/" style="fill-rule: evenodd; clip-rule: evenodd; stroke-linejoin: round; stroke-miterlimit: 2;">
                                            <path id="Twitter" d="M24,12c0,6.627 -5.373,12 -12,12c-6.627,0 -12,-5.373 -12,-12c0,-6.627
                                                5.373,-12 12,-12c6.627,0 12,5.373 12,12Zm-6.465,-3.192c-0.379,0.168
                                                -0.786,0.281 -1.213,0.333c0.436,-0.262 0.771,-0.676
                                                0.929,-1.169c-0.408,0.242 -0.86,0.418 -1.341,0.513c-0.385,-0.411
                                                -0.934,-0.667 -1.541,-0.667c-1.167,0 -2.112,0.945 -2.112,2.111c0,0.166
                                                0.018,0.327 0.054,0.482c-1.754,-0.088 -3.31,-0.929
                                                -4.352,-2.206c-0.181,0.311 -0.286,0.674 -0.286,1.061c0,0.733 0.373,1.379
                                                0.94,1.757c-0.346,-0.01 -0.672,-0.106 -0.956,-0.264c-0.001,0.009
                                                -0.001,0.018 -0.001,0.027c0,1.023 0.728,1.877 1.694,2.07c-0.177,0.049
                                                -0.364,0.075 -0.556,0.075c-0.137,0 -0.269,-0.014 -0.397,-0.038c0.268,0.838
                                                1.048,1.449 1.972,1.466c-0.723,0.566 -1.633,0.904 -2.622,0.904c-0.171,0
                                                -0.339,-0.01 -0.504,-0.03c0.934,0.599 2.044,0.949 3.237,0.949c3.883,0
                                                6.007,-3.217 6.007,-6.008c0,-0.091 -0.002,-0.183 -0.006,-0.273c0.413,-0.298
                                                0.771,-0.67 1.054,-1.093Z"></path>
                                            </svg>
                                        </a>
                                    
                                        </div>
                                    </div>
                                    
                            </div>
                            </div>
                          
                        </div>
                    </div>
                </transition>
            </div>

            <div class="p-10 lg:w-64">
                <a href="#" class="block w-25 h-10 mx-auto text-orange-500 hover:text-yellow-500">
                    <!--svg class="fill-current w-10 h-10" viewBox="0 0 24 24">
                        <path d="M11.83,1.73C8.43,1.79 6.23,3.32 6.23,3.32C5.95,3.5 5.88,3.91 6.07,4.19C6.27,4.5 6.66,4.55 6.96,4.34C6.96,4.34 11.27,1.15 17.46,4.38C17.75,4.55 18.14,4.45 18.31,4.15C18.5,3.85 18.37,3.47 18.03,3.28C16.36,2.4 14.78,1.96 13.36,1.8C12.83,1.74 12.32,1.72 11.83,1.73M12.22,4.34C6.26,4.26 3.41,9.05 3.41,9.05C3.22,9.34 3.3,9.72 3.58,9.91C3.87,10.1 4.26,10 4.5,9.68C4.5,9.68 6.92,5.5 12.2,5.59C17.5,5.66 19.82,9.65 19.82,9.65C20,9.94 20.38,10.04 20.68,9.87C21,9.69 21.07,9.31 20.9,9C20.9,9 18.15,4.42 12.22,4.34M11.5,6.82C9.82,6.94 8.21,7.55 7,8.56C4.62,10.53 3.1,14.14 4.77,19C4.88,19.33 5.24,19.5 5.57,19.39C5.89,19.28 6.07,18.92 5.95,18.6V18.6C4.41,14.13 5.78,11.2 7.8,9.5C9.77,7.89 13.25,7.5 15.84,9.1C17.11,9.9 18.1,11.28 18.6,12.64C19.11,14 19.08,15.32 18.67,15.94C18.25,16.59 17.4,16.83 16.65,16.64C15.9,16.45 15.29,15.91 15.26,14.77C15.23,13.06 13.89,12 12.5,11.84C11.16,11.68 9.61,12.4 9.21,14C8.45,16.92 10.36,21.07 14.78,22.45C15.11,22.55 15.46,22.37 15.57,22.04C15.67,21.71 15.5,21.35 15.15,21.25C11.32,20.06 9.87,16.43 10.42,14.29C10.66,13.33 11.5,13 12.38,13.08C13.25,13.18 14,13.7 14,14.79C14.05,16.43 15.12,17.54 16.34,17.85C17.56,18.16 18.97,17.77 19.72,16.62C20.5,15.45 20.37,13.8 19.78,12.21C19.18,10.61 18.07,9.03 16.5,8.04C14.96,7.08 13.19,6.7 11.5,6.82M11.86,9.25V9.26C10.08,9.32 8.3,10.24 7.28,12.18C5.96,14.67 6.56,17.21 7.44,19.04C8.33,20.88 9.54,22.1 9.54,22.1C9.78,22.35 10.17,22.35 10.42,22.11C10.67,21.87 10.67,21.5 10.43,21.23C10.43,21.23 9.36,20.13 8.57,18.5C7.78,16.87 7.3,14.81 8.38,12.77C9.5,10.67 11.5,10.16 13.26,10.67C15.04,11.19 16.53,12.74 16.5,15.03C16.46,15.38 16.71,15.68 17.06,15.7C17.4,15.73 17.7,15.47 17.73,15.06C17.79,12.2 15.87,10.13 13.61,9.47C13.04,9.31 12.45,9.23 11.86,9.25M12.08,14.25C11.73,14.26 11.46,14.55 11.47,14.89C11.47,14.89 11.5,16.37 12.31,17.8C13.15,19.23 14.93,20.59 18.03,20.3C18.37,20.28 18.64,20 18.62,19.64C18.6,19.29 18.3,19.03 17.91,19.06C15.19,19.31 14.04,18.28 13.39,17.17C12.74,16.07 12.72,14.88 12.72,14.88C12.72,14.53 12.44,14.25 12.08,14.25Z"></path>
                    </svg-->
                    <img class="topBarLogo" src="../../assets/TimeManager_logo.png" width="500" height="90" alt="" loading="lazy">
                </a>
            </div>

            <!-- Extract: Notifications Vue component -->
            <div class="w-16 h-16 flex justify-center items-center text-gray-600 border-l border-gray-600">
                <button class="p-1 hover:text-white focus:text-white focus:outline-none" :class="{'text-white': isNotificationsOpen}" @click="this.setNotificationsOpen">
                    <svg class="fill-current w-10 h-10" viewBox="0 0 24 24">
                        <path d="M11.5,22C11.64,22 11.77,22 11.9,21.96C12.55,21.82 13.09,21.38 13.34,20.78C13.44,20.54 13.5,20.27 13.5,20H9.5A2,2 0 0,0 11.5,22M18,10.5C18,7.43 15.86,4.86 13,4.18V3.5A1.5,1.5 0 0,0 11.5,2A1.5,1.5 0 0,0 10,3.5V4.18C7.13,4.86 5,7.43 5,10.5V16L3,18V19H20V18L18,16M19.97,10H21.97C21.82,6.79 20.24,3.97 17.85,2.15L16.42,3.58C18.46,5 19.82,7.35 19.97,10M6.58,3.58L5.15,2.15C2.76,3.97 1.18,6.79 1,10H3C3.18,7.35 4.54,5 6.58,3.58Z"></path>
                    </svg>
                </button>

                <transition enter-active-class="transition duration-200 ease-in-out" enter-class="opacity-0">
                    <div v-show="isNotificationsOpen" class="absolute inset-0 z-30 min-h-screen bg-black opacity-50 focus:outline-none" @click="this.setNotificationsOpen" tabindex="-1">
                    </div>
                </transition>

                <transition enter-active-class="transition duration-200 ease-in-out transform" enter-class="translate-x-full" leave-active-class="transition duration-200 ease-in-out transform" leave-to-class="translate-x-full">
                    <div v-show="isNotificationsOpen" class="pt-16 absolute inset-0 h-full h-screen">
                        <div ref="notifications" class="mt-16 absolute right-0 inset-y-0 w-full max-w-sm overflow-y-auto">
                            <div class="relative z-40 py-2 text-gray-700 bg-white border border-yellow-400 shadow-lg">
                                <a href="#" class="block px-4 py-2 hover:text-gray-100 hover:bg-gray-800" v-for="i in Array(5).keys()" :key="i">
                                    Notification {{ i+1 }}
                                </a>
                            </div>
                        </div>
                    </div>
                </transition>
            </div>
        </nav>

        <aside class="hidden pt-16 w-64 text-white bg-gray-700 fixed inset-y-0 overflow-x-hidden overflow-y-auto lg:block">
            <div class="p-4 min-h-full">
                <!-- Extract: user_info blade partial -->
                <div class="px-6 pb-3 flex items-center border-b border-gray-100 sm:flex-col">
                    <div class="hidden px-3 text-white text-base rounded-full border sm:block">My space</div>
                    <div class="mr-auto text-white flex-shrink-0 flex flex-col justify-center items-center rounded-full sm:mt-4 sm:mx-auto">
                        <!--svg class="fill-current w-24 h-24 sm:w-32 sm:h-32" viewBox="0 0 24 24">
                            <path d="M12,8L10.67,8.09C9.81,7.07 7.4,4.5 5,4.5C5,4.5 3.03,7.46 4.96,11.41C4.41,12.24 4.07,12.67 4,13.66L2.07,13.95L2.28,14.93L4.04,14.67L4.18,15.38L2.61,16.32L3.08,17.21L4.53,16.32C5.68,18.76 8.59,20 12,20C15.41,20 18.32,18.76 19.47,16.32L20.92,17.21L21.39,16.32L19.82,15.38L19.96,14.67L21.72,14.93L21.93,13.95L20,13.66C19.93,12.67 19.59,12.24 19.04,11.41C20.97,7.46 19,4.5 19,4.5C16.6,4.5 14.19,7.07 13.33,8.09L12,8M9,11A1,1 0 0,1 10,12A1,1 0 0,1 9,13A1,1 0 0,1 8,12A1,1 0 0,1 9,11M15,11A1,1 0 0,1 16,12A1,1 0 0,1 15,13A1,1 0 0,1 14,12A1,1 0 0,1 15,11M11,14H13L12.3,15.39C12.5,16.03 13.06,16.5 13.75,16.5A1.5,1.5 0 0,0 15.25,15H15.75A2,2 0 0,1 13.75,17C13,17 12.35,16.59 12,16V16H12C11.65,16.59 11,17 10.25,17A2,2 0 0,1 8.25,15H8.75A1.5,1.5 0 0,0 10.25,16.5C10.94,16.5 11.5,16.03 11.7,15.39L11,14Z" />
                        </svg!-->
                            <img class="object-cover w-16 h-16 rounded-full mb-3 mt-2" :src="currentUser.photo" alt="Profile image"/>
                      <span >Hello, <strong>{{ currentUser.username }}</strong> !</span>
                      <span class="text-yellow-500 text-xs">{{currentUser.job}}</span>
                            <button @click="logout" class="app-button text-red-500 hover:text-white text-sm hover:bg-red-800">Logout</button>

                    </div>
<!--                    <div class="ml-4 flex-1 flex flex-row sm:mt-4 sm:ml-0 justify-baseline sm:items-center">-->
<!--                        <div class="text-white text-2xl sm:hidden">Hello, </div>-->
<!--                      <div class="text-yellow-500 text-xl sm:text-sm userSidebar__greetings"><strong>{{ currentUser.username }}!</strong></div>-->
<!--                    -->
<!--                    </div>-->
                </div>

                <!-- Extract: menu_items -->
                <div class="mt-4">
                    <!-- TODO: add group here and group-hover to the shevron icon to show it only when the group is hovered -->
                    <!--items -->
                  <div class="sidebar__link">

                        <router-link to="/" > <a class="px-10 flex items-center text-xl text-gray-100 hover:text-orange-500 sm:px-4 sm:text-base">
                                <div class="ml-6 flex-1 sm:ml-4 ">
                                <span >Overview</span>
                                </div>
                            <svg class="fill-current w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M9.3 8.7a1 1 0 011.4-1.4l4 4a1 1 0 010 1.4l-4 4a1 1 0 01-1.4-1.4l3.29-3.3-3.3-3.3z" /></svg>
                        </a></router-link>
                    </div>

                    <div class="sidebar__link">
                        <!--items -->
                            <router-link to="/profile" ><a class="px-10 flex items-center text-xl text-gray-100 hover:text-orange-500 sm:px-4 sm:text-base">
                            <div class="ml-6 flex-1 sm:ml-4">
                                <span >Profile</span>
                                </div>
                            <svg class="fill-current w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M9.3 8.7a1 1 0 011.4-1.4l4 4a1 1 0 010 1.4l-4 4a1 1 0 01-1.4-1.4l3.29-3.3-3.3-3.3z" /></svg>
                        </a></router-link>
                    </div>

                    <span class="sidebar__category">Manage my work</span>

                    <div class="sidebar__link">
                    <!--items -->
                    <router-link to="/attendance" ><a class="px-10 flex items-center text-xl text-gray-100 hover:text-orange-500 sm:px-4 sm:text-base">
                            <div class="ml-6 flex-1 sm:ml-4">
                                    <span>Attendance</span>
                                </div>

                            <svg class="fill-current w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M9.3 8.7a1 1 0 011.4-1.4l4 4a1 1 0 010 1.4l-4 4a1 1 0 01-1.4-1.4l3.29-3.3-3.3-3.3z" /></svg>
                        </a></router-link>
                    </div>

                    <div class="sidebar__link">
                    <!--items -->
                        <router-link to="/colleagues"><a class="px-10 flex items-center text-xl text-gray-100 hover:text-orange-500 sm:px-4 sm:text-base">
                            <div class="ml-6 flex-1 sm:ml-4">
                                    <span>My colleagues</span>
                                </div>

                            <svg class="fill-current w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M9.3 8.7a1 1 0 011.4-1.4l4 4a1 1 0 010 1.4l-4 4a1 1 0 01-1.4-1.4l3.29-3.3-3.3-3.3z" /></svg>
                        </a></router-link>
                    </div>

                    <div class="sidebar__link">
                        <!--items -->
                        <router-link to="/schedule"><a class="px-10 flex items-center text-xl text-gray-100 hover:text-orange-500 sm:px-4 sm:text-base">
                            <div class="ml-6 flex-1 sm:ml-4">
                                    <span>My schedule</span>
                                </div>
                            <svg class="fill-current w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M9.3 8.7a1 1 0 011.4-1.4l4 4a1 1 0 010 1.4l-4 4a1 1 0 01-1.4-1.4l3.29-3.3-3.3-3.3z" /></svg>
                        </a></router-link>
                    </div>
                            <!--    <router-link to="/timeoff" class="sidebar__link">Request time-off</router-link>-->

                        <span class="sidebar__category">Manage my employees</span>

                    <!--items -->
                    <div class="sidebar__link">
                        <router-link to="/employees"><a class="px-10 flex items-center text-xl text-gray-100 hover:text-orange-500 sm:px-4 sm:text-base">
                            <div class="ml-6 flex-1 sm:ml-4">
                                    <span>Employees</span>
                                </div>

                            <svg class="fill-current w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M9.3 8.7a1 1 0 011.4-1.4l4 4a1 1 0 010 1.4l-4 4a1 1 0 01-1.4-1.4l3.29-3.3-3.3-3.3z" /></svg>
                        </a></router-link>
                    </div>

                        <!--items -->
                        <div class="sidebar__link">
                        <router-link to="/team/all"><a class="px-10 flex items-center text-xl text-gray-100 hover:text-orange-500 sm:px-4 sm:text-base">
                            <div class="ml-6 flex-1 sm:ml-4">
                                    <span>Teams</span>
                                </div>

                            <svg class="fill-current w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M9.3 8.7a1 1 0 011.4-1.4l4 4a1 1 0 010 1.4l-4 4a1 1 0 01-1.4-1.4l3.29-3.3-3.3-3.3z" /></svg>
                        </a></router-link>
                        </div>
            </div>
              <!--footer-->
            <div class="px-6 pb-6 flex items-center border-b border-gray-100 sm:flex-col">
                    <div class="text-gray-500 mt-10">
                        <div class="mt-1">© Copyright 2021.</div>
                    </div>

                    <!--logo social network-->
                 <div class="md:flex-auto md:flex-row-reverse mt-2 flex-row flex">
                <a href="/#" class="w-6 mx-1">
                    <svg class="fill-current cursor-pointer text-gray-500 hover:text-gray-400" width="100%" height="100%" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/" style="fill-rule: evenodd; clip-rule: evenodd; stroke-linejoin: round; stroke-miterlimit: 2;">
                    <path id="Facebook" d="M24,12c0,6.627 -5.373,12 -12,12c-6.627,0 -12,-5.373 -12,-12c0,-6.627
                        5.373,-12 12,-12c6.627,0 12,5.373
                        12,12Zm-11.278,0l1.294,0l0.172,-1.617l-1.466,0l0.002,-0.808c0,-0.422
                        0.04,-0.648 0.646,-0.648l0.809,0l0,-1.616l-1.295,0c-1.555,0 -2.103,0.784
                        -2.103,2.102l0,0.97l-0.969,0l0,1.617l0.969,0l0,4.689l1.941,0l0,-4.689Z"></path>
                    </svg>
                </a>
                <a href="/#" class="w-6 mx-1">
                    <svg class="fill-current cursor-pointer text-gray-500 hover:text-gray-400" width="100%" height="100%" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/" style="fill-rule: evenodd; clip-rule: evenodd; stroke-linejoin: round; stroke-miterlimit: 2;">
                    <path id="Shape" d="M7.3,0.9c1.5,-0.6 3.1,-0.9 4.7,-0.9c1.6,0 3.2,0.3 4.7,0.9c1.5,0.6 2.8,1.5
                        3.8,2.6c1,1.1 1.9,2.3 2.6,3.8c0.7,1.5 0.9,3 0.9,4.7c0,1.7 -0.3,3.2
                        -0.9,4.7c-0.6,1.5 -1.5,2.8 -2.6,3.8c-1.1,1 -2.3,1.9 -3.8,2.6c-1.5,0.7
                        -3.1,0.9 -4.7,0.9c-1.6,0 -3.2,-0.3 -4.7,-0.9c-1.5,-0.6 -2.8,-1.5
                        -3.8,-2.6c-1,-1.1 -1.9,-2.3 -2.6,-3.8c-0.7,-1.5 -0.9,-3.1 -0.9,-4.7c0,-1.6
                        0.3,-3.2 0.9,-4.7c0.6,-1.5 1.5,-2.8 2.6,-3.8c1.1,-1 2.3,-1.9
                        3.8,-2.6Zm-0.3,7.1c0.6,0 1.1,-0.2 1.5,-0.5c0.4,-0.3 0.5,-0.8 0.5,-1.3c0,-0.5
                        -0.2,-0.9 -0.6,-1.2c-0.4,-0.3 -0.8,-0.5 -1.4,-0.5c-0.6,0 -1.1,0.2
                        -1.4,0.5c-0.3,0.3 -0.6,0.7 -0.6,1.2c0,0.5 0.2,0.9 0.5,1.3c0.3,0.4 0.9,0.5
                        1.5,0.5Zm1.5,10l0,-8.5l-3,0l0,8.5l3,0Zm11,0l0,-4.5c0,-1.4 -0.3,-2.5
                        -0.9,-3.3c-0.6,-0.8 -1.5,-1.2 -2.6,-1.2c-0.6,0 -1.1,0.2 -1.5,0.5c-0.4,0.3
                        -0.8,0.8 -0.9,1.3l-0.1,-1.3l-3,0l0.1,2l0,6.5l3,0l0,-4.5c0,-0.6 0.1,-1.1
                        0.4,-1.5c0.3,-0.4 0.6,-0.5 1.1,-0.5c0.5,0 0.9,0.2 1.1,0.5c0.2,0.3 0.4,0.8
                        0.4,1.5l0,4.5l2.9,0Z"></path>
                    </svg>
                </a>
                <a href="/#" class="w-6 mx-1">
                    <svg class="fill-current cursor-pointer text-gray-500 hover:text-gray-400" width="100%" height="100%" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/" style="fill-rule: evenodd; clip-rule: evenodd; stroke-linejoin: round; stroke-miterlimit: 2;">
                    <path id="Twitter" d="M24,12c0,6.627 -5.373,12 -12,12c-6.627,0 -12,-5.373 -12,-12c0,-6.627
                        5.373,-12 12,-12c6.627,0 12,5.373 12,12Zm-6.465,-3.192c-0.379,0.168
                        -0.786,0.281 -1.213,0.333c0.436,-0.262 0.771,-0.676
                        0.929,-1.169c-0.408,0.242 -0.86,0.418 -1.341,0.513c-0.385,-0.411
                        -0.934,-0.667 -1.541,-0.667c-1.167,0 -2.112,0.945 -2.112,2.111c0,0.166
                        0.018,0.327 0.054,0.482c-1.754,-0.088 -3.31,-0.929
                        -4.352,-2.206c-0.181,0.311 -0.286,0.674 -0.286,1.061c0,0.733 0.373,1.379
                        0.94,1.757c-0.346,-0.01 -0.672,-0.106 -0.956,-0.264c-0.001,0.009
                        -0.001,0.018 -0.001,0.027c0,1.023 0.728,1.877 1.694,2.07c-0.177,0.049
                        -0.364,0.075 -0.556,0.075c-0.137,0 -0.269,-0.014 -0.397,-0.038c0.268,0.838
                        1.048,1.449 1.972,1.466c-0.723,0.566 -1.633,0.904 -2.622,0.904c-0.171,0
                        -0.339,-0.01 -0.504,-0.03c0.934,0.599 2.044,0.949 3.237,0.949c3.883,0
                        6.007,-3.217 6.007,-6.008c0,-0.091 -0.002,-0.183 -0.006,-0.273c0.413,-0.298
                        0.771,-0.67 1.054,-1.093Z"></path>
                    </svg>
                </a>
            
            </div>
        </div>
            
       </div>
     
      </aside>
</template>

<script>
import Api from '../../api'

export default {
  name: "Navbar",

   async mounted() {
     this.currentUser = (await Api.getUser(this.$store.state.user.id)).data.data
  },
  data() {
    return {
      isMenuOpen: false,
      isNotificationsOpen: false,
      currentUser: {}
    }
  },
  methods: {
    setMenuOpen() {
      this.$refs.menu.scrollTo(0, 0);
      this.isMenuOpen = !this.isMenuOpen
    },
       setNotificationsOpen() {
      this.$refs.notifications.scrollTo(0, 0);
      this.isNotificationsOpen = !this.isNotificationsOpen
  },
    async logout() {
      await Api.logout()
      this.$router.go()
    },
    // async getCurrentUser() {
    //   axios.get(`http://localhost:4000/api/users/${this.$store.state.user.id}`)
    //   .catch(e => console.log(e))
    //   .then(result => this.currentUser = result.data.data)
    // }
     },
}
</script>

<style scoped>
.h-screen {
    height: 100vh;
    height: -webkit-fill-available;
}
.min-h-screen {
    min-height: 100vh;
    min-height: -webkit-fill-available;
}
.max-h-screen {
    max-height: 100vh;
    max-height: -webkit-fill-available;
}
.topBarLogo {
  max-width: 200px;
  width: auto;
  height: auto;
  margin-left: -30px;
}

.customActiveClass{@apply bg-purple-500}
</style>