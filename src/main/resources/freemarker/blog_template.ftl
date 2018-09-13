<!DOCTYPE html>
<html>
<head>
    <title>My Blog</title>
</head>
<body>

<#if username??>
    Welcome ${username} <a href="/logout">Logout</a> | <a href="/newpost">New Post</a>

    <p>
</#if>

<h1>My Blog</h1>

<#if myposts?has_content>
  <#list myposts as post>
      <h2><a href="/post/${post["permalink"]}">${post["title"]}</a></h2>
      Posted ${post["date"]?datetime} <i>By ${post["author"]}</i><br>
      Comments:
      <#if post["comments"]??>
          <#assign numComments = post["comments"]?size>
              <#else>
                  <#assign numComments = 0>
      </#if>

      <a href="/post/${post["permalink"]}">${numComments}</a>
      <hr>
      ${post["body"]!""}
      <p>

      <p>
          <em>Filed Under</em>:
          <#if post["tags"]??>
              <#list post["tags"] as tag>
                  <a href="/tag/${tag}">${tag}</a>
              </#list>
          </#if>

      <p>
  </#list>
<#else>
  <h2>There are no posts yet. Please add a post!</h2>
</#if>
</body>
</html>

