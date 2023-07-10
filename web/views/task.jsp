<%-- 
    Document   : task.jsp
    Created on : Jun 25, 2023, 12:53:49 AM
    Author     : Admin
--%>
<%@page import = "models.entity.Task" %>
<% Task task = (Task) request.getAttribute("task"); %>
<div class="container_task_and_submit">
  <div class="problem_content">
    <div class="tool_bar">
      <p><%= task.getTaskname() %></p>
    </div>
    <iframe src="./public/tasks/<%= task.getSlug() %>.pdf"></iframe>
  </div>

  <div class="submit">
    <form method="post" action="/homepage/tasks/submit" enctype="multipart/form-data">
      <input type="hidden" value='<%= task.getTaskname() %>' name="task_name">
      <input type="hidden" value='<%= task.getSlug() %>' name="task_slug">
      <input type="file" id="solution" name="solution" required accept=".c"><br>
      <button type="submit">Submit</button><br>
    </form>
  </div>
</div>

<div style="height: 6em;background-color: #f6f6f6;">
</div>
<script>
  var uploadField = document.getElementById("solution");
  var myFile = "";
  uploadField.onchange = function () {
    if (this.files[0].size > 2*1024*1024) {
      alert("File is too big!");
      this.value = "";
    };
    myFile = this.files[0].name;
    console.log(myFile);
    var upld = myFile.split('.').pop();
    if (upld != 'c')  {
      alert("Only C file are allowed");
      this.value = "";
    }
  };
</script>


