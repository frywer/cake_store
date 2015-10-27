!function(a,b){"use strict";function c(a,b){for(var c,d=[],f=0;f<a.length;++f){if(c=g[a[f]]||e(a[f]),!c)throw"module definition dependecy not found: "+a[f];d.push(c)}b.apply(null,d)}function d(a,d,e){if("string"!=typeof a)throw"invalid module definition, module id must be defined and be a string";if(d===b)throw"invalid module definition, dependencies must be specified";if(e===b)throw"invalid module definition, definition function must be specified";c(d,function(){g[a]=e.apply(null,arguments)})}function e(b){for(var c=a,d=b.split(/[.\/]/),e=0;e<d.length;++e){if(!c[d[e]])return;c=c[d[e]]}return c}function f(c){var d,e,f,h,i;for(d=0;d<c.length;d++){e=a,f=c[d],h=f.split(/[.\/]/);for(var j=0;j<h.length-1;++j)e[h[j]]===b&&(e[h[j]]={}),e=e[h[j]];e[h[h.length-1]]=g[f]}if(a.AMDLC_TESTS){i=a.privateModules||{};for(f in g)i[f]=g[f];for(d=0;d<c.length;d++)delete i[c[d]];a.privateModules=i}}var g={};d("tinymce/imagetoolsplugin/Canvas",[],function(){function a(a,b){return c(document.createElement("canvas"),a,b)}function b(a){return a.getContext("2d")}function c(a,b,c){return a.width=b,a.height=c,a}return{create:a,resize:c,get2dContext:b}}),d("tinymce/imagetoolsplugin/Mime",[],function(){function a(a){var b=document.createElement("a");return b.href=a,b.pathname}function b(b){var c=a(b).split("."),d=c[c.length-1],e={jpg:"image/jpeg",jpeg:"image/jpeg",png:"image/png"};return d&&(d=d.toLowerCase()),e[d]}return{guessMimeType:b}}),d("tinymce/imagetoolsplugin/ImageSize",[],function(){function a(a){return a.naturalWidth||a.width}function b(a){return a.naturalHeight||a.height}return{getWidth:a,getHeight:b}}),d("tinymce/imagetoolsplugin/Conversions",["tinymce/util/Promise","tinymce/imagetoolsplugin/Canvas","tinymce/imagetoolsplugin/Mime","tinymce/imagetoolsplugin/ImageSize"],function(a,b,c,d){function e(b){return new a(function(a){function c(){b.removeEventListener("load",c),a(b)}b.complete?a(b):b.addEventListener("load",c)})}function f(a){return e(a).then(function(a){var c,e;return e=b.create(d.getWidth(a),d.getHeight(a)),c=b.get2dContext(e),c.drawImage(a,0,0),e})}function g(a){return e(a).then(function(a){var b=a.src;return 0===b.indexOf("blob:")?i(b):0===b.indexOf("data:")?j(b):f(a).then(function(a){return j(a.toDataURL(c.guessMimeType(b)))})})}function h(b){return new a(function(a){function c(){d.removeEventListener("load",c),a(d)}var d=new Image;d.addEventListener("load",c),d.src=URL.createObjectURL(b),d.complete&&c()})}function i(b){return new a(function(a){var c=new XMLHttpRequest;c.open("GET",b,!0),c.responseType="blob",c.onload=function(){200==this.status&&a(this.response)},c.send()})}function j(b){return new a(function(a){var c,d,e,f,g,h;if(b=b.split(","),f=/data:([^;]+)/.exec(b[0]),f&&(g=f[1]),c=atob(b[1]),window.WebKitBlobBuilder){for(h=new WebKitBlobBuilder,d=new ArrayBuffer(c.length),e=0;e<d.length;e++)d[e]=c.charCodeAt(e);return h.append(d),void a(h.getBlob(g))}for(d=new Uint8Array(c.length),e=0;e<d.length;e++)d[e]=c.charCodeAt(e);a(new Blob([d],{type:g}))})}function k(a){return 0===a.indexOf("blob:")?i(a):0===a.indexOf("data:")?j(a):null}function l(a,b){return j(a.toDataURL(b))}function m(b){return new a(function(a){var c=new FileReader;c.onloadend=function(){a(c.result)},c.readAsDataURL(b)})}function n(a){return m(a).then(function(a){return a.split(",")[1]})}function o(a){URL.revokeObjectURL(a.src)}return{blobToImage:h,imageToBlob:g,uriToBlob:k,blobToDataUri:m,blobToBase64:n,imageToCanvas:f,canvasToBlob:l,revokeImageUrl:o}}),d("tinymce/imagetoolsplugin/ImageTools",["tinymce/imagetoolsplugin/Conversions","tinymce/imagetoolsplugin/Canvas","tinymce/imagetoolsplugin/ImageSize"],function(a,b,c){function d(d,e){return a.blobToImage(d).then(function(f){var g=b.create(c.getWidth(f),c.getHeight(f)),i=b.get2dContext(g),j=0,k=0;return e=0>e?360+e:e,(90==e||270==e)&&b.resize(g,g.height,g.width),(90==e||180==e)&&(j=g.width),(270==e||180==e)&&(k=g.height),i.translate(j,k),i.rotate(e*Math.PI/180),i.drawImage(f,0,0),h(f),a.canvasToBlob(g,d.type)})}function e(d,e){return a.blobToImage(d).then(function(d){var f=b.create(c.getWidth(d),c.getHeight(d)),g=b.get2dContext(f);return"v"==e?(g.scale(1,-1),g.drawImage(d,0,-f.height)):(g.scale(-1,1),g.drawImage(d,-f.width,0)),h(d),a.canvasToBlob(f)})}function f(c,d,e,f,g){return a.blobToImage(c).then(function(c){var i=b.create(f,g),j=b.get2dContext(i);return j.drawImage(c,-d,-e),h(c),a.canvasToBlob(i)})}function g(c,d,e){return a.blobToImage(c).then(function(f){var g=b.create(d,e),i=b.get2dContext(g);return i.drawImage(f,0,0,d,e),h(f),a.canvasToBlob(g,c.type)})}var h=a.revokeImageUrl;return{rotate:d,flip:e,crop:f,resize:g}}),d("tinymce/imagetoolsplugin/CropRect",["tinymce/dom/DomQuery","tinymce/ui/DragHelper","tinymce/ui/Rect","tinymce/util/Tools","tinymce/util/Observable"],function(a,b,c,d,e){var f=0;return function(g,h,i,j){function k(a,b){return{x:b.x+a.x,y:b.y+a.y,w:b.w,h:b.h}}function l(a,b){return{x:b.x-a.x,y:b.y-a.y,w:b.w,h:b.h}}function m(){return l(i,g)}function n(){function e(a){var d;return new b(A,{document:j.ownerDocument,handle:A+"-"+a.name,start:function(){d=g},drag:function(b){var e,f,h,j,k;e=d.x,f=d.y,h=d.w,j=d.h,e+=b.deltaX*a.deltaX,f+=b.deltaY*a.deltaY,h+=b.deltaX*a.deltaW,j+=b.deltaY*a.deltaH,20>h&&(h=20),20>j&&(j=20),k=g=c.clamp({x:e,y:f,w:h,h:j},i,"move"==a.name),k=l(i,k),v.fire("updateRect",{rect:k}),s(k)}})}a('<div id="'+A+'" class="'+z+'croprect-container" data-mce-bogus="all">').appendTo(j),d.each(y,function(b){a("#"+A,j).append('<div id="'+A+"-"+b+'"class="'+z+'croprect-block" style="display: none" data-mce-bogus="all">')}),d.each(w,function(b){a("#"+A,j).append('<div id="'+A+"-"+b.name+'" class="'+z+"croprect-handle "+z+"croprect-handle-"+b.name+'" style="display: none" data-mce-bogus="all">')}),x=d.map(w,e),p(g)}function o(b){var c;c=d.map(w,function(a){return"#"+A+"-"+a.name}).concat(d.map(y,function(a){return"#"+A+"-"+a})).join(","),b?a(c,j).show():a(c,j).hide()}function p(b){function c(b,c){c.h<0&&(c.h=0),c.w<0&&(c.w=0),a("#"+A+"-"+b,j).css({left:c.x,top:c.y,width:c.w,height:c.h})}d.each(w,function(c){a("#"+A+"-"+c.name,j).css({left:b.w*c.xMul+b.x,top:b.h*c.yMul+b.y})}),c("top",{x:h.x,y:h.y,w:h.w,h:b.y-h.y}),c("right",{x:b.x+b.w,y:b.y,w:h.w-b.x-b.w+h.x,h:b.h}),c("bottom",{x:h.x,y:b.y+b.h,w:h.w,h:h.h-b.y-b.h+h.y}),c("left",{x:h.x,y:b.y,w:b.x-h.x,h:b.h}),c("move",b)}function q(a){g=a,p(g)}function r(a){h=a,p(g)}function s(a){q(k(i,a))}function t(a){i=a,p(g)}function u(){d.each(x,function(a){a.destroy()}),x=[]}var v,w,x,y,z="mce-",A=z+"crid-"+f++;return w=[{name:"move",xMul:0,yMul:0,deltaX:1,deltaY:1,deltaW:0,deltaH:0},{name:"nw",xMul:0,yMul:0,deltaX:1,deltaY:1,deltaW:-1,deltaH:-1},{name:"ne",xMul:1,yMul:0,deltaX:0,deltaY:1,deltaW:1,deltaH:-1},{name:"sw",xMul:0,yMul:1,deltaX:1,deltaY:0,deltaW:-1,deltaH:1},{name:"se",xMul:1,yMul:1,deltaX:0,deltaY:0,deltaW:1,deltaH:1}],y=["top","right","bottom","left"],n(j),v=d.extend({toggleVisibility:o,setClampRect:t,setRect:q,getInnerRect:m,setInnerRect:s,setViewPortRect:r,destroy:u},e)}}),d("tinymce/imagetoolsplugin/ImagePanel",["tinymce/ui/Control","tinymce/ui/DragHelper","tinymce/ui/Rect","tinymce/util/Tools","tinymce/util/Promise","tinymce/imagetoolsplugin/CropRect"],function(a,b,c,d,e,f){function g(a){return new e(function(b){function c(){a.removeEventListener("load",c),b(a)}a.complete?b(a):a.addEventListener("load",c)})}return a.extend({Defaults:{classes:"imagepanel"},selection:function(a){return arguments.length?(this.state.set("rect",a),this):this.state.get("rect")},imageSize:function(){var a=this.state.get("viewRect");return{w:a.w,h:a.h}},toggleCropRect:function(a){this.state.set("cropEnabled",a)},imageSrc:function(a){var b=this,d=new Image;d.src=a,g(d).then(function(){var a,e,f=b.state.get("viewRect");e=b.$el.find("img"),e[0]?e.replaceWith(d):b.getEl().appendChild(d),a={x:0,y:0,w:d.naturalWidth,h:d.naturalHeight},b.state.set("viewRect",a),b.state.set("rect",c.inflate(a,-20,-20)),f&&f.w==a.w&&f.h==a.h||b.zoomFit(),b.repaintImage(),b.fire("load")})},zoom:function(a){return arguments.length?(this.state.set("zoom",a),this):this.state.get("zoom")},postRender:function(){return this.imageSrc(this.settings.imageSrc),this._super()},zoomFit:function(){var a,b,c,d,e,f,g,h=this;g=10,a=h.$el.find("img"),b=h.getEl().clientWidth,c=h.getEl().clientHeight,d=a[0].naturalWidth,e=a[0].naturalHeight,f=Math.min((b-g)/d,(c-g)/e),f>=1&&(f=1),h.zoom(f)},repaintImage:function(){var a,b,c,d,e,f,g,h,i,j;j=this.getEl(),h=this.zoom(),i=this.state.get("rect"),g=this.$el.find("img"),e=j.offsetWidth,f=j.offsetHeight,c=g[0].naturalWidth*h,d=g[0].naturalHeight*h,a=Math.max(0,e/2-c/2),b=Math.max(0,f/2-d/2),g.css({left:a,top:b,width:c,height:d}),this.cropRect&&(this.cropRect.setRect({x:i.x*h+a,y:i.y*h+b,w:i.w*h,h:i.h*h}),this.cropRect.setClampRect({x:a,y:b,w:c,h:d}),this.cropRect.setViewPortRect({x:0,y:0,w:e,h:f}))},bindStates:function(){function a(a){b.cropRect=new f(a,b.state.get("viewRect"),b.state.get("viewRect"),b.getEl()),b.cropRect.on("updateRect",function(a){var c=a.rect,d=b.zoom();c={x:Math.round(c.x/d),y:Math.round(c.y/d),w:Math.round(c.w/d),h:Math.round(c.h/d)},b.state.set("rect",c)}),b.on("remove",b.cropRect.destroy)}var b=this;b.state.on("change:cropEnabled",function(a){b.cropRect.toggleVisibility(a.value),b.repaintImage()}),b.state.on("change:zoom",function(){b.repaintImage()}),b.state.on("change:rect",function(c){var d=c.value;b.cropRect||a(d),b.cropRect.setRect(d)})}})}),d("tinymce/imagetoolsplugin/ColorMatrix",[],function(){function a(a,b,c){return a=parseFloat(a),a>c?a=c:b>a&&(a=b),a}function b(){return[1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1]}function c(a,b){var c,d,e,f,g=[],h=new Array(10);for(c=0;5>c;c++){for(d=0;5>d;d++)g[d]=b[d+5*c];for(d=0;5>d;d++){for(f=0,e=0;5>e;e++)f+=a[d+5*e]*g[e];h[d+5*c]=f}}return h}function d(b,c){return c=a(c,0,1),b.map(function(b,d){return d%6===0?b=1-(1-b)*c:b*=c,a(b,0,1)})}function e(b,d){var e;return d=a(d,-1,1),d*=100,0>d?e=127+d/100*127:(e=d%1,e=0===e?l[d]:l[Math.floor(d)]*(1-e)+l[Math.floor(d)+1]*e,e=127*e+127),c(b,[e/127,0,0,0,.5*(127-e),0,e/127,0,0,.5*(127-e),0,0,e/127,0,.5*(127-e),0,0,0,1,0,0,0,0,0,1])}function f(b,d){var e,f,g,h;return d=a(d,-1,1),e=1+(d>0?3*d:d),f=.3086,g=.6094,h=.082,c(b,[f*(1-e)+e,g*(1-e),h*(1-e),0,0,f*(1-e),g*(1-e)+e,h*(1-e),0,0,f*(1-e),g*(1-e),h*(1-e)+e,0,0,0,0,0,1,0,0,0,0,0,1])}function g(b,d){var e,f,g,h,i;return d=a(d,-180,180)/180*Math.PI,e=Math.cos(d),f=Math.sin(d),g=.213,h=.715,i=.072,c(b,[g+e*(1-g)+f*-g,h+e*-h+f*-h,i+e*-i+f*(1-i),0,0,g+e*-g+.143*f,h+e*(1-h)+.14*f,i+e*-i+f*-.283,0,0,g+e*-g+f*-(1-g),h+e*-h+f*h,i+e*(1-i)+f*i,0,0,0,0,0,1,0,0,0,0,0,1])}function h(b,d){return d=a(255*d,-255,255),c(b,[1,0,0,0,d,0,1,0,0,d,0,0,1,0,d,0,0,0,1,0,0,0,0,0,1])}function i(b,d,e,f){return d=a(d,0,2),e=a(e,0,2),f=a(f,0,2),c(b,[d,0,0,0,0,0,e,0,0,0,0,0,f,0,0,0,0,0,1,0,0,0,0,0,1])}function j(b,e){return e=a(e,0,1),c(b,d([.393,.769,.189,0,0,.349,.686,.168,0,0,.272,.534,.131,0,0,0,0,0,1,0,0,0,0,0,1],e))}function k(b,e){return e=a(e,0,1),c(b,d([.33,.34,.33,0,0,.33,.34,.33,0,0,.33,.34,.33,0,0,0,0,0,1,0,0,0,0,0,1],e))}var l=[0,.01,.02,.04,.05,.06,.07,.08,.1,.11,.12,.14,.15,.16,.17,.18,.2,.21,.22,.24,.25,.27,.28,.3,.32,.34,.36,.38,.4,.42,.44,.46,.48,.5,.53,.56,.59,.62,.65,.68,.71,.74,.77,.8,.83,.86,.89,.92,.95,.98,1,1.06,1.12,1.18,1.24,1.3,1.36,1.42,1.48,1.54,1.6,1.66,1.72,1.78,1.84,1.9,1.96,2,2.12,2.25,2.37,2.5,2.62,2.75,2.87,3,3.2,3.4,3.6,3.8,4,4.3,4.7,4.9,5,5.5,6,6.5,6.8,7,7.3,7.5,7.8,8,8.4,8.7,9,9.4,9.6,9.8,10];return{identity:b,adjust:d,multiply:c,adjustContrast:e,adjustBrightness:h,adjustSaturation:f,adjustHue:g,adjustColors:i,adjustSepia:j,adjustGrayscale:k}}),d("tinymce/imagetoolsplugin/Filters",["tinymce/imagetoolsplugin/Canvas","tinymce/imagetoolsplugin/ImageSize","tinymce/imagetoolsplugin/Conversions","tinymce/imagetoolsplugin/ColorMatrix"],function(a,b,c,d){function e(d,e){return c.blobToImage(d).then(function(d){function f(a,b){var c,d,e,f,g,h=a.data,i=b[0],j=b[1],k=b[2],l=b[3],m=b[4],n=b[5],o=b[6],p=b[7],q=b[8],r=b[9],s=b[10],t=b[11],u=b[12],v=b[13],w=b[14],x=b[15],y=b[16],z=b[17],A=b[18],B=b[19];for(g=0;g<h.length;g+=4)c=h[g],d=h[g+1],e=h[g+2],f=h[g+3],h[g]=c*i+d*j+e*k+f*l+m,h[g+1]=c*n+d*o+e*p+f*q+r,h[g+2]=c*s+d*t+e*u+f*v+w,h[g+3]=c*x+d*y+e*z+f*A+B;return a}var g,h=a.create(b.getWidth(d),b.getHeight(d)),i=a.get2dContext(h);return i.drawImage(d,0,0),k(d),g=f(i.getImageData(0,0,h.width,h.height),e),i.putImageData(g,0,0),c.canvasToBlob(h)})}function f(d,e){return c.blobToImage(d).then(function(d){function f(a,b,c){function d(a,b,c){return a>c?a=c:b>a&&(a=b),a}var e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u;for(g=Math.round(Math.sqrt(c.length)),h=Math.floor(g/2),e=a.data,f=b.data,t=a.width,u=a.height,j=0;u>j;j++)for(i=0;t>i;i++){for(k=l=m=0,o=0;g>o;o++)for(n=0;g>n;n++)p=d(i+n-h,0,t-1),q=d(j+o-h,0,u-1),r=4*(q*t+p),s=c[o*g+n],k+=e[r]*s,l+=e[r+1]*s,m+=e[r+2]*s;r=4*(j*t+i),f[r]=d(k,0,255),f[r+1]=d(l,0,255),f[r+2]=d(m,0,255)}return b}var g,h,i=a.create(b.getWidth(d),b.getHeight(d)),j=a.get2dContext(i);return j.drawImage(d,0,0),k(d),g=j.getImageData(0,0,i.width,i.height),h=j.getImageData(0,0,i.width,i.height),h=f(g,h,e),j.putImageData(h,0,0),c.canvasToBlob(i)})}function g(d){return function(e,f){return c.blobToImage(e).then(function(e){function g(a,b){var c,d=a.data;for(c=0;c<d.length;c+=4)d[c]=b[d[c]],d[c+1]=b[d[c+1]],d[c+2]=b[d[c+2]];return a}var h,i,j=a.create(b.getWidth(e),b.getHeight(e)),l=a.get2dContext(j),m=new Array(256);for(i=0;i<m.length;i++)m[i]=d(i,f);return l.drawImage(e,0,0),k(e),h=g(l.getImageData(0,0,j.width,j.height),m),l.putImageData(h,0,0),c.canvasToBlob(j)})}}function h(a){return function(b,c){return e(b,a(d.identity(),c))}}function i(a){return function(b){return e(b,a)}}function j(a){return function(b){return f(b,a)}}var k=c.revokeImageUrl;return{invert:i([-1,0,0,0,255,0,-1,0,0,255,0,0,-1,0,255,0,0,0,1,0]),brightness:h(d.adjustBrightness),hue:h(d.adjustHue),saturate:h(d.adjustSaturation),contrast:h(d.adjustContrast),grayscale:h(d.adjustGrayscale),sepia:h(d.adjustSepia),colorize:function(a,b,c,f){return e(a,d.adjustColors(d.identity(),b,c,f))},sharpen:j([0,-1,0,-1,5,-1,0,-1,0]),emboss:j([-2,-1,0,-1,1,1,0,1,2]),gamma:g(function(a,b){return 255*Math.pow(a/255,1-b)}),exposure:g(function(a,b){return 255*(1-Math.exp(-(a/255)*b))}),colorFilter:e,convoluteFilter:f}}),d("tinymce/imagetoolsplugin/UndoStack",[],function(){return function(){function a(a){var b;return b=f.splice(++g),f.push(a),{state:a,removed:b}}function b(){return d()?f[--g]:void 0}function c(){return e()?f[++g]:void 0}function d(){return g>0}function e(){return-1!=g&&g<f.length-1}var f=[],g=-1;return{data:f,add:a,undo:b,redo:c,canUndo:d,canRedo:e}}}),d("tinymce/imagetoolsplugin/Dialog",["tinymce/dom/DOMUtils","tinymce/util/Tools","tinymce/util/Promise","tinymce/ui/Factory","tinymce/ui/Form","tinymce/ui/Container","tinymce/imagetoolsplugin/ImagePanel","tinymce/imagetoolsplugin/ImageTools","tinymce/imagetoolsplugin/Filters","tinymce/imagetoolsplugin/Conversions","tinymce/imagetoolsplugin/UndoStack"],function(a,b,c,d,e,f,g,h,i,j,k){function l(a){return{blob:a,url:URL.createObjectURL(a)}}function m(a){a&&URL.revokeObjectURL(a.url)}function n(a){b.each(a,m)}function o(c,j,o){function p(a){var b,c,d,e;b=M.find("#w")[0],c=M.find("#h")[0],d=parseInt(b.value(),10),e=parseInt(c.value(),10),M.find("#constrain")[0].checked()&&ha&&ia&&d&&e&&("w"==a.control.settings.name?(e=Math.round(d*ja),c.value(e)):(d=Math.round(e*ka),b.value(d))),ha=d,ia=e}function q(a){return Math.round(100*a)+"%"}function r(){M.find("#undo").disabled(!la.canUndo()),M.find("#redo").disabled(!la.canRedo()),M.statusbar.find("#save").disabled(!la.canUndo())}function s(){M.find("#undo").disabled(!0),M.find("#redo").disabled(!0)}function t(a){a&&T.imageSrc(a.url)}function u(a){return function(){var c=b.grep(ga,function(b){return b.settings.name!=a});b.each(c,function(a){a.hide()}),a.show()}}function v(a){P=l(a),t(P)}function w(a){c=l(a),t(c),n(la.add(c).removed),r()}function x(){var a=T.selection();h.crop(c.blob,a.x,a.y,a.w,a.h).then(function(a){w(a),A()})}function y(a){var b=[].slice.call(arguments,1);return function(){var d=P||c;a.apply(this,[d.blob].concat(b)).then(v)}}function z(a){var b=[].slice.call(arguments,1);return function(){a.apply(this,[c.blob].concat(b)).then(w)}}function A(){t(c),m(P),u(N)(),r()}function B(){P&&(w(P.blob),A())}function C(){var a=T.zoom();2>a&&(a+=.1),T.zoom(a)}function D(){var a=T.zoom();a>.1&&(a-=.1),T.zoom(a)}function E(){c=la.undo(),t(c),r()}function F(){c=la.redo(),t(c),r()}function G(){j(c.blob),M.close()}function H(a){return new e({layout:"flex",direction:"row",labelGap:5,border:"0 0 1 0",align:"center",pack:"center",padding:"0 10 0 10",spacing:5,flex:0,minHeight:60,defaults:{classes:"imagetool",type:"button"},items:a})}function I(a,b){return H([{text:"Back",onclick:A},{type:"spacer",flex:1},{text:"Apply",subtype:"primary",onclick:B}]).hide().on("show",function(){s(),b(c.blob).then(function(a){var b=l(a);t(b),m(P),P=b})})}function J(a,b,d,e,f){function g(a){b(c.blob,a).then(function(a){var b=l(a);t(b),m(P),P=b})}return H([{text:"Back",onclick:A},{type:"spacer",flex:1},{type:"slider",flex:1,ondragend:function(a){g(a.value)},minValue:e,maxValue:f,value:d,previewFilter:q},{type:"spacer",flex:1},{text:"Apply",subtype:"primary",onclick:B}]).hide().on("show",function(){this.find("slider").value(d),s()})}function K(a,b){function d(){var a,d,e;a=M.find("#r")[0].value(),d=M.find("#g")[0].value(),e=M.find("#b")[0].value(),b(c.blob,a,d,e).then(function(a){var b=l(a);t(b),m(P),P=b})}return H([{text:"Back",onclick:A},{type:"spacer",flex:1},{type:"slider",label:"R",name:"r",minValue:0,value:1,maxValue:2,ondragend:d,previewFilter:q},{type:"slider",label:"G",name:"g",minValue:0,value:1,maxValue:2,ondragend:d,previewFilter:q},{type:"slider",label:"B",name:"b",minValue:0,value:1,maxValue:2,ondragend:d,previewFilter:q},{type:"spacer",flex:1},{text:"Apply",subtype:"primary",onclick:B}]).hide().on("show",function(){M.find("#r,#g,#b").value(1),s()})}function L(a){a.control.value()===!0&&(ja=ia/ha,ka=ha/ia)}var M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,$,_,aa,ba,ca,da,ea,fa,ga,ha,ia,ja,ka,la=new k;Q=H([{text:"Back",onclick:A},{type:"spacer",flex:1},{text:"Apply",subtype:"primary",onclick:x}]).hide().on("show hide",function(a){T.toggleCropRect("show"==a.type)}).on("show",s),R=H([{text:"Back",onclick:A},{type:"spacer",flex:1},{type:"textbox",name:"w",label:"Width",size:4,onkeyup:p},{type:"textbox",name:"h",label:"Height",size:4,onkeyup:p},{type:"checkbox",name:"constrain",text:"Constrain proportions",checked:!0,onchange:L},{type:"spacer",flex:1},{text:"Apply",subtype:"primary",onclick:"submit"}]).hide().on("submit",function(a){var b=parseInt(M.find("#w").value(),10),c=parseInt(M.find("#h").value(),10);a.preventDefault(),z(h.resize,b,c)(),A()}).on("show",s),S=H([{text:"Back",onclick:A},{type:"spacer",flex:1},{icon:"fliph",tooltip:"Flip horizontally",onclick:y(h.flip,"h")},{icon:"flipv",tooltip:"Flip vertically",onclick:y(h.flip,"v")},{icon:"rotateleft",tooltip:"Rotate counterclockwise",onclick:y(h.rotate,-90)},{icon:"rotateright",tooltip:"Rotate clockwise",onclick:y(h.rotate,90)},{type:"spacer",flex:1},{text:"Apply",subtype:"primary",onclick:B}]).hide().on("show",s),W=I("Invert",i.invert),ca=I("Sharpen",i.sharpen),da=I("Emboss",i.emboss),X=J("Brightness",i.brightness,0,-1,1),Y=J("Hue",i.hue,180,0,360),Z=J("Saturate",i.saturate,0,-1,1),$=J("Contrast",i.contrast,0,-1,1),_=J("Grayscale",i.grayscale,0,0,1),aa=J("Sepia",i.sepia,0,0,1),ba=K("Colorize",i.colorize),ea=J("Gamma",i.gamma,0,-1,1),fa=J("Exposure",i.exposure,1,0,2),O=H([{text:"Back",onclick:A},{type:"spacer",flex:1},{text:"hue",icon:"hue",onclick:u(Y)},{text:"saturate",icon:"saturate",onclick:u(Z)},{text:"sepia",icon:"sepia",onclick:u(aa)},{text:"emboss",icon:"emboss",onclick:u(da)},{text:"exposure",icon:"exposure",onclick:u(fa)},{type:"spacer",flex:1}]).hide(),N=H([{tooltip:"Crop",icon:"crop",onclick:u(Q)},{tooltip:"Resize",icon:"resize2",onclick:u(R)},{tooltip:"Orientation",icon:"orientation",onclick:u(S)},{tooltip:"Brightness",icon:"sun",onclick:u(X)},{tooltip:"Sharpen",icon:"sharpen",onclick:u(ca)},{tooltip:"Contrast",icon:"contrast",onclick:u($)},{tooltip:"Color levels",icon:"drop",onclick:u(ba)},{tooltip:"Gamma",icon:"gamma",onclick:u(ea)},{tooltip:"Invert",icon:"invert",onclick:u(W)}]),T=new g({flex:1,imageSrc:c.url}),U=new f({layout:"flex",direction:"column",border:"0 1 0 0",padding:5,spacing:5,items:[{type:"button",icon:"undo",tooltip:"Undo",name:"undo",onclick:E},{type:"button",icon:"redo",tooltip:"Redo",name:"redo",onclick:F},{type:"button",icon:"zoomin",tooltip:"Zoom in",onclick:C},{type:"button",icon:"zoomout",tooltip:"Zoom out",onclick:D}]}),V=new f({type:"container",layout:"flex",direction:"row",align:"stretch",flex:1,items:[U,T]}),ga=[N,Q,R,S,O,W,X,Y,Z,$,_,aa,ba,ca,da,ea,fa],M=d.create("window",{layout:"flex",direction:"column",align:"stretch",minWidth:Math.min(a.DOM.getViewPort().w,800),minHeight:Math.min(a.DOM.getViewPort().h,650),title:"Edit image",items:ga.concat([V]),buttons:[{text:"Save",name:"save",subtype:"primary",onclick:G},{text:"Cancel",onclick:"close"}]}),M.renderTo(document.body).reflow(),M.on("close",function(){o(),n(la.data),la=null,P=null}),la.add(c),r(),T.on("load",function(){ha=T.imageSize().w,ia=T.imageSize().h,ja=ia/ha,ka=ha/ia,M.find("#w").value(ha),M.find("#h").value(ia)})}function p(a){return new c(function(b,c){o(l(a),b,c)})}return{edit:p}}),d("tinymce/imagetoolsplugin/Plugin",["tinymce/PluginManager","tinymce/Env","tinymce/util/Promise","tinymce/util/URI","tinymce/util/Tools","tinymce/imagetoolsplugin/ImageTools","tinymce/imagetoolsplugin/Conversions","tinymce/imagetoolsplugin/Dialog"],function(a,c,d,e,f,g,h,i){a.add("imagetools",function(a){function j(b){function c(a){return a.indexOf("px")==a.length-2}var d,e;return d=b.style.width,e=b.style.height,d||e?c(d)&&c(e)?{w:parseInt(d,10),h:parseInt(e,10)}:null:(d=a.$(b).attr("width"),e=a.$(b).attr("height"),d&&e?{w:parseInt(d,10),h:parseInt(e,10)}:null)}function k(b,c){var d,e;c&&(d=b.style.width,e=b.style.height,(d||e)&&a.$(b).css({width:c.w,height:c.h}).removeAttr("data-mce-style"),d=b.width,e=b.height,(d||e)&&a.$(b).attr({width:c.w,height:c.h}))}function l(a){return{w:a.naturalWidth,h:a.naturalHeight}}function m(){return a.selection.getNode()}function n(){return"imagetools"+G++}function o(b){var c=b.src;return 0===c.indexOf("data:")||0===c.indexOf("blob:")||new e(c).host===a.documentBaseURI.host}function p(b){return-1!==f.inArray(a.settings.imagetools_cors_hosts,new e(b.src).host)}function q(a){return new d(function(b){var c=new XMLHttpRequest;c.onload=function(){b(this.response)},c.open("GET",a,!0),c.responseType="blob",c.send()})}function r(b){var c=b.src;return p(b)?q(b.src):(o(b)||(c=a.settings.imagetools_proxy,c+=(-1===c.indexOf("?")?"?":"&")+"url="+encodeURIComponent(b.src),b=new Image,b.src=c),h.imageToBlob(b))}function s(){var b;return b=a.editorUpload.blobCache.getByUri(m().src),b?b:r(m()).then(function(b){return h.blobToBase64(b).then(function(c){var d=a.editorUpload.blobCache,e=d.create(n(),b,c);return d.add(e),e})})}function t(){E=setTimeout(function(){a.editorUpload.uploadImagesAuto()},3e4)}function u(){clearTimeout(E)}function v(b,c){return h.blobToDataUri(b).then(function(d){var f,g,h,i,j;return j=m(),f=n(),h=a.editorUpload.blobCache,g=e.parseDataUri(d).data,i=h.create(f,b,g),h.add(i),a.undoManager.transact(function(){function b(){a.$(j).off("load",b),a.nodeChanged(),c?a.editorUpload.uploadImagesAuto():(u(),t())}a.$(j).on("load",b),a.$(j).attr({src:i.blobUri()}).removeAttr("data-mce-src")}),i})}function w(b){return function(){return a._scanForImages().then(s).then(b).then(v)}}function x(a){return function(){return w(function(b){var c=j(m());return c&&k(m(),{w:c.h,h:c.w}),g.rotate(b.blob(),a)})()}}function y(a){return function(){return w(function(b){return g.flip(b.blob(),a)})()}}function z(){var a=m(),b=l(a);a&&r(a).then(i.edit).then(function(c){return new d(function(d){h.blobToImage(c).then(function(e){var f=l(e);(b.w!=f.w||b.h!=f.h)&&j(a)&&k(a,f),URL.revokeObjectURL(e.src),d(c)})})}).then(function(a){v(a,!0)},function(){})}function A(){a.addButton("rotateleft",{title:"Rotate counterclockwise",onclick:x(-90)}),a.addButton("rotateright",{title:"Rotate clockwise",onclick:x(90)}),a.addButton("flipv",{title:"Flip vertically",onclick:y("v")}),a.addButton("fliph",{title:"Flip horizontally",onclick:y("h")}),a.addButton("editimage",{title:"Edit image",onclick:z}),a.addButton("imageoptions",{title:"Image options",icon:"options",cmd:"mceImage"})}function B(){a.on("NodeChange",function(c){F&&F.src!=c.element.src&&(u(),a.editorUpload.uploadImagesAuto(),F=b),C(c.element)&&(F=c.element)})}function C(b){var c=a.dom.is(b,"img:not([data-mce-object],[data-mce-placeholder])");return c&&(o(b)||p(b)||a.settings.imagetools_proxy)}function D(){var b=a.settings.imagetools_toolbar;b||(b="rotateleft rotateright | flipv fliph | crop editimage imageoptions"),a.addContextToolbar(C,b)}var E,F,G=0;c.fileApi&&(A(),D(),B(),a.addCommand("mceEditImage",z))})}),f(["tinymce/imagetoolsplugin/Canvas","tinymce/imagetoolsplugin/Mime","tinymce/imagetoolsplugin/ImageSize","tinymce/imagetoolsplugin/Conversions","tinymce/imagetoolsplugin/ImageTools","tinymce/imagetoolsplugin/CropRect","tinymce/imagetoolsplugin/ImagePanel","tinymce/imagetoolsplugin/ColorMatrix","tinymce/imagetoolsplugin/Filters","tinymce/imagetoolsplugin/UndoStack","tinymce/imagetoolsplugin/Dialog","tinymce/imagetoolsplugin/Plugin"])}(this);