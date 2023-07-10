<%-- 
    Document   : createTest
    Created on : Jun 25, 2023, 10:54:29 PM
    Author     : Admin
--%>
<%@page import = "models.entity.Testcase" %>
<$@page import = "java.util.List" %>
<% 
  Task task = (Task) request.getAttribute("task"); 
  List<Testcase> testcases = (List<Testcase>) request.getAttribute("testcases");
%>
<h1>
  Add test for <%= task.getTaskName() %>
</h1>
<form method="POST" action="/homepage/tests/create">
  <div class="mb-3">
    <label for="input" class="form-label">Input</label>
    <input type="text" name="input" class="form-control" id="input" placeholder="Enter input" required/>
  </div>
  <div class="mb-3">
    <label for="output" class="form-label">Output</label>
    <input type="number" name="output" class="form-control" id="output" placeholder="Enter output" required/>
  </div>
  <input type="hidden" name="slug" value={{slug}}>
  <button type="submit">Add Test</button>
</form>
  
<button type="button" class="mt-4 bg-white mb-4 bbacktohome"><a href="/homepage" class="text-dark">Back to home</a></button>

<ul class="list-group list-group-horizontal-md test_list_all">
  <%
    int id = 1;
    for(Testcase testcase : testcases) {
  %>
  <li class="list-group-item mr-4 test_list" title='{{this.input}}=>{{this.output}}'>
    <form method="post" action="/homepage/tests/delete">
      <input type="hidden" name="_id" value="<%= id %>">
      <input type="hidden" name="slug" value={{this.task_name}}>
      <button onclick="checkDelete()" type="submit">Test {{@index}} <i class="fa-solid fa-circle-minus"></i></a></button>
    </form>
  </li>
  <% } %>
</ul>

<script>
  function checkDelete(){ var a = confirm("are you sure?"); if(a) {
    window.location.href='/homepage/tasks/delete'; } }
</script>

<div style="height: 6em"></div>
