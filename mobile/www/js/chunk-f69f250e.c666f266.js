(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-f69f250e"],{"129f":function(e,t){e.exports=Object.is||function(e,t){return e===t?0!==e||1/e===1/t:e!=e&&t!=t}},"14c3":function(e,t,n){var o=n("da84"),r=n("c65b"),a=n("825a"),c=n("1626"),l=n("c6b6"),i=n("9263"),s=o.TypeError;e.exports=function(e,t){var n=e.exec;if(c(n)){var o=r(n,e,t);return null!==o&&a(o),o}if("RegExp"===l(e))return r(i,e,t);throw s("RegExp#exec called on incompatible receiver")}},1737:function(e,t,n){},"35ae":function(e,t,n){"use strict";n("3a10")},"3a10":function(e,t,n){},"3c50":function(e,t,n){"use strict";n("1737")},4169:function(e,t,n){"use strict";var o=n("7a23"),r=Object(o["createTextVNode"])(" Modify "),a={key:0,class:"overflow-x-hidden text-black overflow-y-auto fixed inset-0 z-50 outline-none focus:outline-none justify-center items-center flex"},c={class:"relative w-auto my-6 mx-auto max-w-3xl"},l={class:"border-0 rounded-lg shadow-lg relative flex flex-col w-full bg-white outline-none focus:outline-none"},i={class:"flex items-start justify-between p-5 border-b border-solid border-blueGray-200 rounded-t"},s=Object(o["createTextVNode"])(" Modal Title "),d=Object(o["createElementVNode"])("span",{class:"bg-transparent text-black opacity-5 h-6 w-6 text-2xl block outline-none focus:outline-none"}," × ",-1),u=[d],m={class:"relative p-6 flex-auto"},b=Object(o["createTextVNode"])("..."),p={class:"flex items-center justify-end p-6 border-t border-solid border-blueGray-200 rounded-b"},f=Object(o["createTextVNode"])(" Save Changes "),h={key:1,class:"opacity-25 fixed inset-0 z-40 bg-black"};function v(e,t,n,d,v,g){return Object(o["openBlock"])(),Object(o["createElementBlock"])("div",null,[Object(o["createElementVNode"])("button",{class:"font-bold",type:"button",onClick:t[0]||(t[0]=function(e){return g.toggleModal()})},[Object(o["renderSlot"])(e.$slots,"buttonName",{},(function(){return[r]}))]),v.showModal?(Object(o["openBlock"])(),Object(o["createElementBlock"])("div",a,[Object(o["createElementVNode"])("div",c,[Object(o["createElementVNode"])("div",l,[Object(o["createElementVNode"])("div",i,[Object(o["renderSlot"])(e.$slots,"title",{},(function(){return[s]})),Object(o["createElementVNode"])("button",{class:"p-1 ml-auto bg-transparent border-0 text-black opacity-5 float-right text-3xl leading-none font-semibold outline-none focus:outline-none",onClick:t[1]||(t[1]=function(e){return g.toggleModal()})},u)]),Object(o["createElementVNode"])("div",m,[Object(o["renderSlot"])(e.$slots,"body",{},(function(){return[b]}))]),Object(o["createElementVNode"])("div",p,[Object(o["createElementVNode"])("button",{class:"text-blue-500 bg-transparent border border-solid border-blue-500 hover:bg-blue-500 hover:text-white active:bg-blue-600 font-bold uppercase text-sm px-6 py-3 rounded outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150",type:"button",onClick:t[2]||(t[2]=function(e){return g.toggleModal()})}," Close "),Object(o["createElementVNode"])("button",{class:"text-blue-500 bg-transparent border border-solid border-blue-500 hover:bg-blue-500 hover:text-white active:bg-blue-600 font-bold uppercase text-sm px-6 py-3 rounded outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150",type:"button",onClick:t[3]||(t[3]=function(e){return g.saveChanges()})},[Object(o["renderSlot"])(e.$slots,"button",{},(function(){return[f]}))])])])])])):Object(o["createCommentVNode"])("",!0),v.showModal?(Object(o["openBlock"])(),Object(o["createElementBlock"])("div",h)):Object(o["createCommentVNode"])("",!0)])}var g={name:"large-modal",data:function(){return{showModal:!1}},methods:{toggleModal:function(){this.showModal=!this.showModal},saveChanges:function(){this.$emit("save")}}},j=n("6b0d"),O=n.n(j);const y=O()(g,[["render",v]]);t["a"]=y},"841c":function(e,t,n){"use strict";var o=n("c65b"),r=n("d784"),a=n("825a"),c=n("1d80"),l=n("129f"),i=n("577e"),s=n("dc4a"),d=n("14c3");r("search",(function(e,t,n){return[function(t){var n=c(this),r=void 0==t?void 0:s(t,e);return r?o(r,t,n):new RegExp(t)[e](i(n))},function(e){var o=a(this),r=i(e),c=n(t,o,r);if(c.done)return c.value;var s=o.lastIndex;l(s,0)||(o.lastIndex=0);var u=d(o,r);return l(o.lastIndex,s)||(o.lastIndex=s),null===u?-1:u.index}]}))},9062:function(e,t,n){!function(t,o){e.exports=o(n("7a23"))}(0,(function(e){return(()=>{"use strict";var t={982:t=>{t.exports=e}},n={};function o(e){var r=n[e];if(void 0!==r)return r.exports;var a=n[e]={exports:{}};return t[e](a,a.exports,o),a.exports}o.d=(e,t)=>{for(var n in t)o.o(t,n)&&!o.o(e,n)&&Object.defineProperty(e,n,{enumerable:!0,get:t[n]})},o.o=(e,t)=>Object.prototype.hasOwnProperty.call(e,t),o.r=e=>{"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})};var r={};return(()=>{o.r(r),o.d(r,{default:()=>N,useLoading:()=>y});var e=o(982);const t="undefined"!=typeof window?window.HTMLElement:Object,n={class:"vld-icon"},a={mounted(){this.enforceFocus&&document.addEventListener("focusin",this.focusIn)},methods:{focusIn(e){if(!this.isActive)return;if(e.target===this.$refs.root||this.$refs.root.contains(e.target))return;let t=this.container?this.container:this.isFullPage?null:this.$refs.root.parentElement;(this.isFullPage||t&&t.contains(e.target))&&(e.preventDefault(),this.$refs.root.focus())}},beforeUnmount(){document.removeEventListener("focusin",this.focusIn)}},c=(0,e.createVNode)("g",{fill:"none","fill-rule":"evenodd"},[(0,e.createVNode)("g",{transform:"translate(1 1)","stroke-width":"2"},[(0,e.createVNode)("circle",{"stroke-opacity":".25",cx:"18",cy:"18",r:"18"}),(0,e.createVNode)("path",{d:"M36 18c0-9.94-8.06-18-18-18"},[(0,e.createVNode)("animateTransform",{attributeName:"transform",type:"rotate",from:"0 18 18",to:"360 18 18",dur:"0.8s",repeatCount:"indefinite"})])])],-1),l=(0,e.defineComponent)({name:"spinner",props:{color:{type:String,default:"#000"},height:{type:Number,default:64},width:{type:Number,default:64}}});l.render=function(t,n,o,r,a,l){return(0,e.openBlock)(),(0,e.createBlock)("svg",{viewBox:"0 0 38 38",xmlns:"http://www.w3.org/2000/svg",width:t.width,height:t.height,stroke:t.color},[c],8,["width","height","stroke"])};const i=l,s=(0,e.createVNode)("circle",{cx:"15",cy:"15",r:"15"},[(0,e.createVNode)("animate",{attributeName:"r",from:"15",to:"15",begin:"0s",dur:"0.8s",values:"15;9;15",calcMode:"linear",repeatCount:"indefinite"}),(0,e.createVNode)("animate",{attributeName:"fill-opacity",from:"1",to:"1",begin:"0s",dur:"0.8s",values:"1;.5;1",calcMode:"linear",repeatCount:"indefinite"})],-1),d=(0,e.createVNode)("circle",{cx:"60",cy:"15",r:"9","fill-opacity":"0.3"},[(0,e.createVNode)("animate",{attributeName:"r",from:"9",to:"9",begin:"0s",dur:"0.8s",values:"9;15;9",calcMode:"linear",repeatCount:"indefinite"}),(0,e.createVNode)("animate",{attributeName:"fill-opacity",from:"0.5",to:"0.5",begin:"0s",dur:"0.8s",values:".5;1;.5",calcMode:"linear",repeatCount:"indefinite"})],-1),u=(0,e.createVNode)("circle",{cx:"105",cy:"15",r:"15"},[(0,e.createVNode)("animate",{attributeName:"r",from:"15",to:"15",begin:"0s",dur:"0.8s",values:"15;9;15",calcMode:"linear",repeatCount:"indefinite"}),(0,e.createVNode)("animate",{attributeName:"fill-opacity",from:"1",to:"1",begin:"0s",dur:"0.8s",values:"1;.5;1",calcMode:"linear",repeatCount:"indefinite"})],-1),m=(0,e.defineComponent)({name:"dots",props:{color:{type:String,default:"#000"},height:{type:Number,default:240},width:{type:Number,default:60}}});m.render=function(t,n,o,r,a,c){return(0,e.openBlock)(),(0,e.createBlock)("svg",{viewBox:"0 0 120 30",xmlns:"http://www.w3.org/2000/svg",fill:t.color,width:t.width,height:t.height},[s,d,u],8,["fill","width","height"])};const b=m,p=(0,e.createVNode)("rect",{x:"0",y:"13",width:"4",height:"5"},[(0,e.createVNode)("animate",{attributeName:"height",attributeType:"XML",values:"5;21;5",begin:"0s",dur:"0.6s",repeatCount:"indefinite"}),(0,e.createVNode)("animate",{attributeName:"y",attributeType:"XML",values:"13; 5; 13",begin:"0s",dur:"0.6s",repeatCount:"indefinite"})],-1),f=(0,e.createVNode)("rect",{x:"10",y:"13",width:"4",height:"5"},[(0,e.createVNode)("animate",{attributeName:"height",attributeType:"XML",values:"5;21;5",begin:"0.15s",dur:"0.6s",repeatCount:"indefinite"}),(0,e.createVNode)("animate",{attributeName:"y",attributeType:"XML",values:"13; 5; 13",begin:"0.15s",dur:"0.6s",repeatCount:"indefinite"})],-1),h=(0,e.createVNode)("rect",{x:"20",y:"13",width:"4",height:"5"},[(0,e.createVNode)("animate",{attributeName:"height",attributeType:"XML",values:"5;21;5",begin:"0.3s",dur:"0.6s",repeatCount:"indefinite"}),(0,e.createVNode)("animate",{attributeName:"y",attributeType:"XML",values:"13; 5; 13",begin:"0.3s",dur:"0.6s",repeatCount:"indefinite"})],-1),v=(0,e.defineComponent)({name:"bars",props:{color:{type:String,default:"#000"},height:{type:Number,default:40},width:{type:Number,default:40}}});v.render=function(t,n,o,r,a,c){return(0,e.openBlock)(),(0,e.createBlock)("svg",{xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 30 30",height:t.height,width:t.width,fill:t.color},[p,f,h],8,["height","width","fill"])};const g={Spinner:i,Dots:b,Bars:v},j=(0,e.defineComponent)({name:"vue-loading",mixins:[a],props:{active:Boolean,programmatic:Boolean,container:[Object,Function,t],isFullPage:{type:Boolean,default:!0},enforceFocus:{type:Boolean,default:!0},lockScroll:{type:Boolean,default:!1},transition:{type:String,default:"fade"},canCancel:Boolean,onCancel:{type:Function,default:()=>{}},color:String,backgroundColor:String,blur:{type:String,default:"2px"},opacity:Number,width:Number,height:Number,zIndex:Number,loader:{type:String,default:"spinner"}},emits:["hide","update:active"],data(){return{isActive:this.active}},components:g,mounted(){document.addEventListener("keyup",this.keyPress)},methods:{cancel(){this.canCancel&&this.isActive&&(this.hide(),this.onCancel.apply(null,arguments))},hide(){this.$emit("hide"),this.$emit("update:active",!1),this.programmatic&&(this.isActive=!1,setTimeout(()=>{const t=this.$refs.root.parentElement;var n,o;(0,e.render)(null,t),void 0!==(n=t).remove?n.remove():null===(o=n.parentNode)||void 0===o||o.removeChild(n)},150))},disableScroll(){this.isFullPage&&this.lockScroll&&document.body.classList.add("vld-shown")},enableScroll(){this.isFullPage&&this.lockScroll&&document.body.classList.remove("vld-shown")},keyPress(e){27===e.keyCode&&this.cancel()}},watch:{active(e){this.isActive=e},isActive(e){e?this.disableScroll():this.enableScroll()}},computed:{bgStyle(){return{background:this.backgroundColor,opacity:this.opacity,backdropFilter:`blur(${this.blur})`}}},beforeUnmount(){document.removeEventListener("keyup",this.keyPress)}});j.render=function(t,o,r,a,c,l){return(0,e.openBlock)(),(0,e.createBlock)(e.Transition,{ref:"root",name:t.transition},{default:(0,e.withCtx)(()=>[(0,e.withDirectives)((0,e.createVNode)("div",{tabindex:"0",class:["vld-overlay is-active",{"is-full-page":t.isFullPage}],"aria-busy":t.isActive,"aria-label":"Loading",style:{zIndex:t.zIndex}},[(0,e.createVNode)("div",{class:"vld-background",onClick:o[1]||(o[1]=(0,e.withModifiers)((...e)=>t.cancel&&t.cancel(...e),["prevent"])),style:t.bgStyle},null,4),(0,e.createVNode)("div",n,[(0,e.renderSlot)(t.$slots,"before"),(0,e.renderSlot)(t.$slots,"default",{},()=>[((0,e.openBlock)(),(0,e.createBlock)((0,e.resolveDynamicComponent)(t.loader),{color:t.color,width:t.width,height:t.height},null,8,["color","width","height"]))]),(0,e.renderSlot)(t.$slots,"after")])],14,["aria-busy"]),[[e.vShow,t.isActive]])]),_:3},8,["name"])};const O=j;function y(t={},n={}){return{show(o=t,r=n){const a=Object.assign({},t,o,{programmatic:!0,lockScroll:!0,isFullPage:!1,active:!0});let c=a.container;a.container||(c=document.body,a.isFullPage=!0);const l=Object.assign({},n,r);return{hide:function(t,n,o,r={}){const a=(0,e.h)(t,n,r),c=document.createElement("div");return c.classList.add("vld-container"),o.appendChild(c),(0,e.render)(a,c),a.component}(O,a,c,l).ctx.hide}}}}O.install=(e,t={},n={})=>{const o=y(t,n);e.config.globalProperties.$loading=o,e.provide("$loading",o)};const N=O})(),r.default})()}))},a265:function(e,t,n){"use strict";var o=n("7a23"),r={class:"main__container"},a=Object(o["createElementVNode"])("div",{class:"error__content flex flex-col items-center mb-8"},[Object(o["createElementVNode"])("h3",{class:"view-title"},"403 Forbidden"),Object(o["createElementVNode"])("span",{class:"text-center mb-5"},"You're not authorized to view this page."),Object(o["createElementVNode"])("img",{src:"https://media1.giphy.com/media/zCpYQh5YVhdI1rVYpE/giphy.gif",alt:"Unauthorized Image"})],-1),c=[a];function l(e,t,n,a,l,i){return Object(o["openBlock"])(),Object(o["createElementBlock"])("div",r,c)}var i={name:"Unauthorized"},s=n("6b0d"),d=n.n(s);const u=d()(i,[["render",l]]);t["a"]=u},d784:function(e,t,n){"use strict";n("ac1f");var o=n("e330"),r=n("6eeb"),a=n("9263"),c=n("d039"),l=n("b622"),i=n("9112"),s=l("species"),d=RegExp.prototype;e.exports=function(e,t,n,u){var m=l(e),b=!c((function(){var t={};return t[m]=function(){return 7},7!=""[e](t)})),p=b&&!c((function(){var t=!1,n=/a/;return"split"===e&&(n={},n.constructor={},n.constructor[s]=function(){return n},n.flags="",n[m]=/./[m]),n.exec=function(){return t=!0,null},n[m](""),!t}));if(!b||!p||n){var f=o(/./[m]),h=t(m,""[e],(function(e,t,n,r,c){var l=o(e),i=t.exec;return i===a||i===d.exec?b&&!c?{done:!0,value:f(t,n,r)}:{done:!0,value:l(n,t,r)}:{done:!1}}));r(String.prototype,e,h[0]),r(d,m,h[1])}u&&i(d[m],"sham",!0)}},e40d:function(e,t,n){},ecd4:function(e,t,n){"use strict";n.r(t);var o=n("7a23"),r={key:0,class:"main__container"},a={class:"employees__all"},c={class:"flex flex-row"},l=Object(o["createElementVNode"])("h3",{class:"view-title"},"Employees",-1);function i(e,t,n,i,s,d){var u=Object(o["resolveComponent"])("AddEmployee"),m=Object(o["resolveComponent"])("EmployeeSearchBar"),b=Object(o["resolveComponent"])("EmployeesList"),p=Object(o["resolveComponent"])("Unauthorized");return"Manager"===this.$store.state.user.role||"General Manager"===this.$store.state.user.role?(Object(o["openBlock"])(),Object(o["createElementBlock"])("div",r,[Object(o["createElementVNode"])("div",a,[Object(o["createElementVNode"])("div",c,[l,"Manager"===this.$store.state.user.role||"General Manager"===this.$store.state.user.role?(Object(o["openBlock"])(),Object(o["createBlock"])(u,{key:0})):Object(o["createCommentVNode"])("",!0)]),Object(o["createVNode"])(m),Object(o["createVNode"])(b)])])):(Object(o["openBlock"])(),Object(o["createBlock"])(p,{key:1}))}var s={key:0,class:"table min-w-full"};function d(e,t,n,r,a,c){var l=Object(o["resolveComponent"])("EmployeesCard"),i=Object(o["resolveComponent"])("loading");return a.areEmployeesLoading?(Object(o["openBlock"])(),Object(o["createBlock"])(i,{key:1,active:a.areEmployeesLoading,"can-cancel":!1,"is-full-page":!1},null,8,["active"])):(Object(o["openBlock"])(),Object(o["createElementBlock"])("table",s,[Object(o["createElementVNode"])("tbody",null,[(Object(o["openBlock"])(!0),Object(o["createElementBlock"])(o["Fragment"],null,Object(o["renderList"])(a.employees,(function(e){return Object(o["openBlock"])(),Object(o["createBlock"])(l,{key:e.id,employee:e},null,8,["employee"])})),128))])]))}var u=n("1da1"),m=(n("96cf"),function(e){return Object(o["pushScopeId"])("data-v-6d13e5e6"),e=e(),Object(o["popScopeId"])(),e}),b={class:"hover:bg-gray-50 hover:shadow-md ease-linear transition-all rounded-lg py-5 px-3 shadow-sm"},p={class:"employee_array__content"},f={class:"flex flex-row items-center"},h=["src"],v={class:"employees__name"},g={class:"font-bold text-gray-700 text-sm"},j={class:"text-gray-500 text-xs"},O={class:"flex flex-col"},y={class:"font-semibold text-sm text-center"},N={class:"text-center text-xs text-gray-500"},x=m((function(){return Object(o["createElementVNode"])("td",null,[Object(o["createElementVNode"])("div",{class:"flex flex-col mx-5"},[Object(o["createElementVNode"])("span",{class:"text-xs text-gray-500 text-center"},"Currently assigned to:"),Object(o["createElementVNode"])("span",{class:"text-center font-semibold text-sm"}," Unassigned ")])],-1)})),E={class:"employee_array__content"},V={class:"sidebar__link"},w=m((function(){return Object(o["createElementVNode"])("img",{src:"https://img.icons8.com/external-sbts2018-blue-sbts2018/50/26e07f/external-profile-social-media-basic-1-sbts2018-blue-sbts2018.png"},null,-1)})),k={class:"sidebar__link"},B=m((function(){return Object(o["createElementVNode"])("img",{src:"https://img.icons8.com/color/50/000000/attendance-mark.png"},null,-1)})),C={class:"sidebar__link"},S=m((function(){return Object(o["createElementVNode"])("img",{src:"https://img.icons8.com/ios-filled/50/26e07f/overtime.png"},null,-1)})),M={class:"sidebar__link"},_=m((function(){return Object(o["createElementVNode"])("img",{src:"https://img.icons8.com/color/50/000000/full-trash.png"},null,-1)})),$=[_];function T(e,t,n,r,a,c){var l=Object(o["resolveComponent"])("router-link");return Object(o["openBlock"])(),Object(o["createElementBlock"])("tr",b,[Object(o["createElementVNode"])("div",p,[Object(o["createElementVNode"])("td",f,[Object(o["createElementVNode"])("img",{class:"object-cover w-10 h-10 rounded-full mx-2",src:n.employee.photo,alt:"Profile image"},null,8,h),Object(o["createElementVNode"])("div",v,[Object(o["createElementVNode"])("span",g,Object(o["toDisplayString"])(n.employee.username),1),Object(o["createElementVNode"])("span",j,Object(o["toDisplayString"])(n.employee.email),1)])]),Object(o["createElementVNode"])("td",null,[Object(o["createElementVNode"])("div",O,[Object(o["createElementVNode"])("span",y,Object(o["toDisplayString"])(n.employee.job),1),Object(o["createElementVNode"])("span",N,Object(o["toDisplayString"])(n.employee.role),1)])]),x,Object(o["createElementVNode"])("div",E,[Object(o["createElementVNode"])("td",V,[this.$store.state.user.id===this.employee.id||"Manager"===this.$store.state.user.role||"General Manager"===this.$store.state.user.role?(Object(o["openBlock"])(),Object(o["createBlock"])(l,{key:0,to:"/profile/".concat(n.employee.id)},{default:Object(o["withCtx"])((function(){return[w]})),_:1},8,["to"])):Object(o["createCommentVNode"])("",!0)]),Object(o["createElementVNode"])("td",k,[this.$store.state.user.id===this.employee.id||"Manager"===this.$store.state.user.role||"General Manager"===this.$store.state.user.role?(Object(o["openBlock"])(),Object(o["createBlock"])(l,{key:0,to:"/attendance/".concat(n.employee.id)},{default:Object(o["withCtx"])((function(){return[B]})),_:1},8,["to"])):Object(o["createCommentVNode"])("",!0)]),Object(o["createElementVNode"])("td",C,[this.$store.state.user.id===this.employee.id||"Manager"===this.$store.state.user.role||"General Manager"===this.$store.state.user.role?(Object(o["openBlock"])(),Object(o["createBlock"])(l,{key:0,to:"/schedule/".concat(n.employee.id)},{default:Object(o["withCtx"])((function(){return[S]})),_:1},8,["to"])):Object(o["createCommentVNode"])("",!0)]),Object(o["createElementVNode"])("td",M,["Manager"===this.$store.state.user.role||"General Manager"===this.$store.state.user.role?(Object(o["openBlock"])(),Object(o["createElementBlock"])("button",{key:0,onClick:t[0]||(t[0]=function(){return c.deleteUser&&c.deleteUser.apply(c,arguments)})},$)):Object(o["createCommentVNode"])("",!0)])])])])}var U=n("365c"),L={name:"EmployeesCard",props:{employee:{}},mounted:function(){this.user_id=this.employee.id},data:function(){return{user_id:""}},methods:{deleteUser:function(){var e=this;return Object(u["a"])(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,U["a"].deleteUser(e.user_id);case 2:e.$router.go();case 3:case"end":return t.stop()}}),t)})))()}}},P=(n("3c50"),n("6b0d")),D=n.n(P);const F=D()(L,[["render",T],["__scopeId","data-v-6d13e5e6"]]);var I=F,A=n("9062"),R=n.n(A),z=(n("e40d"),{name:"EmployeesList",components:{EmployeesCard:I,Loading:R.a},mounted:function(){var e=this;return Object(u["a"])(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,U["a"].getAllUsers();case 2:e.employees=t.sent,e.areEmployeesLoading=!1;case 4:case"end":return t.stop()}}),t)})))()},data:function(){return{employees:[],areEmployeesLoading:!0}}});n("35ae");const X=D()(z,[["render",d],["__scopeId","data-v-1260ee34"]]);var G=X,J=(n("b0c0"),{class:"flex items-center"}),Y={class:"app-button bg-green-500 text-white text-sm hover:bg-green-800"},H=Object(o["createTextVNode"])("+ Add"),q=Object(o["createElementVNode"])("span",{class:"font-semibold"},"Add employee",-1),Q={class:"mb-3"},K=Object(o["createElementVNode"])("span",{id:"messageStatus"},null,-1),W={class:"mb-3"},Z={class:"mb-3"},ee={class:"mb-3"},te=Object(o["createElementVNode"])("br",null,null,-1),ne={key:0,id:"message",class:"font-bold text-red"},oe={class:"mb-3"},re=Object(o["createElementVNode"])("div",null,[Object(o["createElementVNode"])("input",{type:"file",id:"Photo"}),Object(o["createElementVNode"])("br"),Object(o["createElementVNode"])("br")],-1),ae=Object(o["createElementVNode"])("thead",null,[Object(o["createElementVNode"])("tr",null,[Object(o["createElementVNode"])("th",null,"Role for user"),Object(o["createElementVNode"])("th",null,"Team for user")])],-1),ce=["value"],le=["value"],ie=Object(o["createTextVNode"])("Add");function se(e,t,n,r,a,c){var l=this,i=Object(o["resolveComponent"])("Modal");return Object(o["openBlock"])(),Object(o["createElementBlock"])("div",J,[Object(o["createElementVNode"])("button",Y,[Object(o["createVNode"])(i,{onSave:c.createUser},{buttonName:Object(o["withCtx"])((function(){return[H]})),title:Object(o["withCtx"])((function(){return[q]})),body:Object(o["withCtx"])((function(){return[Object(o["createElementVNode"])("form",null,[Object(o["createElementVNode"])("div",Q,[K,Object(o["withDirectives"])(Object(o["createElementVNode"])("input",{type:"username",class:"form-control","onUpdate:modelValue":t[0]||(t[0]=function(t){return e.username=t}),placeholder:"Username",id:"Username"},null,512),[[o["vModelText"],e.username]])]),Object(o["createElementVNode"])("div",W,[Object(o["withDirectives"])(Object(o["createElementVNode"])("input",{type:"email",class:"form-control text-sm px-3","onUpdate:modelValue":t[1]||(t[1]=function(t){return e.email=t}),placeholder:"Email ex : XX@XX.fr","aria-describedby":"emailHelp",required:""},null,512),[[o["vModelText"],e.email]])]),Object(o["createElementVNode"])("div",Z,[Object(o["withDirectives"])(Object(o["createElementVNode"])("input",{type:"password",class:"form-control","onUpdate:modelValue":t[2]||(t[2]=function(t){return e.password=t}),placeholder:"Password",id:"Password"},null,512),[[o["vModelText"],e.password]])]),Object(o["createElementVNode"])("div",ee,[Object(o["withDirectives"])(Object(o["createElementVNode"])("input",{type:"password",class:"form-control","onUpdate:modelValue":t[3]||(t[3]=function(t){return e.confirmPassword=t}),placeholder:"Confirm password",id:"ConfirmPassword"},null,512),[[o["vModelText"],e.confirmPassword]]),te,l.password!==l.confirmPassword?(Object(o["openBlock"])(),Object(o["createElementBlock"])("span",ne," Not matching ")):Object(o["createCommentVNode"])("",!0)]),Object(o["createElementVNode"])("div",oe,[Object(o["withDirectives"])(Object(o["createElementVNode"])("input",{class:"form-control","onUpdate:modelValue":t[4]||(t[4]=function(t){return e.job=t}),placeholder:"Job",id:"Job"},null,512),[[o["vModelText"],e.job]])]),re,Object(o["createElementVNode"])("div",null,[Object(o["createElementVNode"])("table",null,[ae,Object(o["createElementVNode"])("tbody",null,[Object(o["createElementVNode"])("tr",null,[Object(o["createElementVNode"])("td",null,[Object(o["withDirectives"])(Object(o["createElementVNode"])("select",{"onUpdate:modelValue":t[5]||(t[5]=function(e){return l.payload.role=e}),id:"role"},[(Object(o["openBlock"])(!0),Object(o["createElementBlock"])(o["Fragment"],null,Object(o["renderList"])(a.roleList,(function(e){return Object(o["openBlock"])(),Object(o["createElementBlock"])("option",{value:e,key:e.name},Object(o["toDisplayString"])(e.name),9,ce)})),128))],512),[[o["vModelSelect"],l.payload.role]])]),Object(o["createElementVNode"])("td",null,[Object(o["withDirectives"])(Object(o["createElementVNode"])("select",{"onUpdate:modelValue":t[6]||(t[6]=function(e){return l.payload.team=e}),id:"team"},[(Object(o["openBlock"])(!0),Object(o["createElementBlock"])(o["Fragment"],null,Object(o["renderList"])(a.teams,(function(e){return Object(o["openBlock"])(),Object(o["createElementBlock"])("option",{value:e,key:e.id},Object(o["toDisplayString"])(e.name),9,le)})),128))],512),[[o["vModelSelect"],l.payload.team]])])])])])])])]})),button:Object(o["withCtx"])((function(){return[ie]})),_:1},8,["onSave"])])])}var de=n("4169"),ue={name:"AddEmployee",data:function(){return{user:{id:void 0,username:void 0,email:void 0,password:void 0,confirmPassword:void 0,role:void 0,photo:void 0,job:void 0},roleList:[{name:"User"},{name:"Team manager"},{name:"General manager"}],teams:[],payload:{role:void 0,team:void 0}}},components:{Modal:de["a"]},mounted:function(){var e=this;return Object(u["a"])(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,U["a"].getAllTeams();case 2:e.teams=t.sent;case 3:case"end":return t.stop()}}),t)})))()},props:{method:{type:Function}},methods:{createUser:function(){var e=this;return Object(u["a"])(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:if(e.password!==e.confirmPassword){t.next=4;break}return t.next=3,U["a"].createUser({username:e.username,email:e.email,password:e.password,job:e.job,role:e.role}).catch((function(e){e.response?(console.log(e.response.data),console.log(e.response.status),console.log(e.response.headers),document.getElementById("messageStatus").style.color="red",document.getElementById("messageStatus").innerHTML="Please retry, Error : "+e.response.status):this.$router.go()}));case 3:t.sent;case 4:case"end":return t.stop()}}),t)})))()}}};const me=D()(ue,[["render",se]]);var be=me,pe=n("a265"),fe=(n("ac1f"),n("841c"),{class:"flex flex-col mb-3 justify-center"}),he=Object(o["createElementVNode"])("span",{class:"mb-2"},"Search an employee by name and/or email:",-1),ve={class:"employee_search__content"},ge=Object(o["createElementVNode"])("span",{class:"mr-2"},"Name:",-1),je=Object(o["createElementVNode"])("span",{class:"mr-2"},"Email:",-1);function Oe(e,t,n,r,a,c){return Object(o["openBlock"])(),Object(o["createElementBlock"])("div",fe,[he,Object(o["createElementVNode"])("div",ve,[Object(o["createElementVNode"])("div",null,[ge,Object(o["withDirectives"])(Object(o["createElementVNode"])("input",{"onUpdate:modelValue":t[0]||(t[0]=function(e){return a.search.username=e}),class:"text-sm border border-gray-500 rounded-md px-2 py-1 mr-3 hover:border-blue-600",type:"text",placeholder:"Username..."},null,512),[[o["vModelText"],a.search.username]])]),Object(o["createElementVNode"])("div",null,[je,Object(o["withDirectives"])(Object(o["createElementVNode"])("input",{"onUpdate:modelValue":t[1]||(t[1]=function(e){return a.search.email=e}),class:"text-sm border border-gray-500 rounded-md px-2 py-1 mr-3 hover:border-blue-600",type:"email",placeholder:"Email..."},null,512),[[o["vModelText"],a.search.email]])]),Object(o["createElementVNode"])("button",{onClick:t[2]||(t[2]=function(){return c.searchUser&&c.searchUser.apply(c,arguments)}),class:"app-button text-white text-sm bg-blue-500 hover:bg-blue-800"},"Search")])])}var ye={name:"EmployeeSearchBar",data:function(){return{search:{username:"",email:""}}},methods:{searchUser:function(){var e=this;return Object(u["a"])(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:console.log(e.search);case 1:case"end":return t.stop()}}),t)})))()}}};const Ne=D()(ye,[["render",Oe]]);var xe=Ne,Ee={name:"Employees",components:{EmployeeSearchBar:xe,EmployeesList:G,AddEmployee:be,Unauthorized:pe["a"]}};const Ve=D()(Ee,[["render",i]]);t["default"]=Ve}}]);
//# sourceMappingURL=chunk-f69f250e.c666f266.js.map