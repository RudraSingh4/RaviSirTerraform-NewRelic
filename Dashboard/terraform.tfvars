value={
    "data1"= {
        "name"= "dashboard1"
        "permissions"="public_read_only"
        "pagename"="mypage"
        "title"="billboard data"
        "query"="SELECT * FROM AjaxRequest Since 1 day ago LIMIT MAX"
        "title2"="bar data"
        "query2"="SELECT average(duration) FROM Transaction WHERE appName = 'my_application' FACET country"
    }
    "data2"= {
        "name"= "dashboard2"
        "permissions"="public_read_only"
        "pagename"="datapage"
        "title"="billboard"
        "query"="SELECT * FROM AjaxRequest since 1 day ago compare with 1 week ago"
        "title2"="bar data"
        "query2"="SELECT Count(httpResponseCode) FROM AjaxRequest since 1 day ago COMPARE WITH 1 week ago"
    }
}