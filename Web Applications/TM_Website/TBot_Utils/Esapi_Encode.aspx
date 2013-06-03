<%@ Page Language="C#" ValidateRequest="false"%>
<%@ Import Namespace="O2.XRules.Database.APIs" %>
<%@ Import Namespace="O2.DotNetWrappers.ExtensionMethods" %>
<%

    var encodeMethod = Request["method"].str();
    var payload = Request["payload"].str();
    var result = "<a href='?method=encodeForJavaScript&payload={0}'>example</a>".format("some <h1>text to</h1>encode".htmlEncode());
    if (encodeMethod.valid() && payload.valid())
    {
        if (encodeMethod == "none")
            result = payload;
        else
        {
            var esapi = "org.owasp.esapi.ESAPI".java_Class();
            var encoder = esapi.getMethod("encoder", null).invoke(null, null);


            result = encoder.getClass().getMethod(encodeMethod, new java.lang.Class[] {java.lang.String._class})
                            .invoke(encoder, new java.lang.Object[] {payload.java_String()})
                            .ToString();
        }
    }

%>

<%= result.str() %>