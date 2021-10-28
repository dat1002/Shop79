<script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.servletContext.contextPath}/js/bootstrap.bundle.min.js"></script>

<!-- ChartJS -->
<script src="${pageContext.servletContext.contextPath}/js/Chart.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.servletContext.contextPath}/js/adminlte.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/dashboard3.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.servletContext.contextPath}/js/demo.js"></script>
<!-- Page specific script -->
<script src="${pageContext.servletContext.contextPath}/js/them.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.simplePagination.js"></script>
<script>
$(document).ready(function() {
  $('#summernote').summernote();
});
</script>
  <script type="text/javascript">
      $( document ).ready(function() {
          $("#paging").pagination({
              currentPage: ${productsWithPaging.currentPage},
              items: ${productsWithPaging.totalItems},
              itemsOnPage: 5,
              cssStyle: 'dark-theme',
              onPageClick: function(pageNumber, event) {
                  $('#page').val(pageNumber);
                  $('#btnSearch').trigger('click');
              },
          });
      });
  </script>