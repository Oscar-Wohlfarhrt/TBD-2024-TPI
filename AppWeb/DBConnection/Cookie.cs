using System.ComponentModel;
using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;


namespace JSCookie
{
    public static class CookieManager{
        public static string GetCookie(IJSRuntime jsRuntime,string key){
            string cookie = jsRuntime.InvokeAsync<string>("return document.cookie",null).AsTask().Result ?? "";
            return cookie;
        }
        public static void SetCookie(IJSRuntime jsRuntime,string key,string value,float days,string path="/"){
            jsRuntime.InvokeVoidAsync($@"var expires = """"; 
                if (days) {{ 
                    var date = new Date(); 
                    date.setTime(date.getTime() + ({days} * 24 * 60 * 60 * 1000));
                    expires="""" + date.toGMTString(); 
                }}
                document.cookie = ""{key}={value};"" + expires + ""; path={path};"";",null)
                .AsTask().Wait();
        }
    }
}
