<!DOCTYPE html>
<html>
  <head>
    <title>B2B Tour Packages Rate for Agent</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  </head>
  <body>
    <div class="container">
      <h2 class="text-center" style="margin-bottom: 50px; margin-top: 25px">Add/remove multiple input fields dynamically with Jquery Laravel 5.8</h2>

      <form action="{{ route('addMoreProduct') }}" method="POST">
        @csrf

        @if ($errors->any())
          <div class="alert alert-danger">
            <ul>
              @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
              @endforeach
            </ul>
          </div>
        @endif

        @if (Session::has('success'))
          <div class="alert alert-success text-center">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
            <p>{{ Session::get('success') }}</p>
          </div>
        @endif

        <div>
          <div class="form-group">
            <label for="user_name">Enter Your Name</label>
            <input type="text" class="form-control" id="user_name" name="user_name" placeholder="Enter Your Name">
          </div>

          <div class="form-group">
            <label for="user_address">Enter Your Address</label>
            <input type="text" class="form-control" id="user_address" name="user_address" placeholder="Enter your address">
          </div>
        </div>

        <table class="table table-bordered" id="dynamicTable">
          <tr>
            <th>Package Name</th>
            <th>Minimum Paying Person</th>
            <th>Package Type</th>
            <th>Action</th>
          </tr>
          <tr>
            <td>
<!--              <input type="text" name="addmore[0][name]" placeholder="Enter your Name" class="form-control" />-->
              <select name="addmore[0][name]" class="form-control">
                <option>package 1</option>
                <option>package 2</option>
                <option>package 3</option>
              </select>
            </td>
            <td>
{{--              <input type="text" name="addmore[0][qty]" placeholder="Enter your Qty" class="form-control" />--}}
              <select name="addmore[0][person]" class="form-control">
                <option>02-00 PAX</option>
                <option>03-04 PAX</option>
                <option>05-06 PAX</option>
                <option>07-08 PAX</option>
                <option>09-10 PAX</option>
              </select>
            </td>
            <td>
{{--              <input type="text" name="addmore[0][price]" placeholder="Enter your Price" class="form-control" />--}}
              <select name="addmore[0][type]" class="form-control">
                <option>Standard</option>
                <option>Deluxe</option>
                <option>Luxury</option>
              </select>
            </td>
            <td>
              <button type="button" name="add" id="add" class="btn btn-success">Add More</button>
            </td>
          </tr>
        </table>

        <button type="submit" class="btn btn-success">Save</button>
      </form>
    </div>

    <script type="text/javascript">

      var i = 0;

      $("#add").click(function(){

        ++i;

        const select_package = `<select name="addmore[${i}][name]" class="form-control"><option>package 1</option><option>package 2</option><option>package 3</option></select>`;
        const select_type = `<select name="addmore[${i}][type]" class="form-control"><option>Standard</option><option>Deluxe</option><option>Luxury</option></select>`;
        const select_person = `<select name="addmore[${i}][person]" class="form-control"><option>02-00 PAX</option><option>03-04 PAX</option><option>05-06 PAX</option><option>07-08 PAX</option><option>09-10 PAX</option></select>`;

        $("#dynamicTable").append(`<tr><td>${select_package}</td><td>${select_person}</td><td>${select_type}</td><td><button type="button" class="btn btn-danger remove-tr">Remove</button></td></tr>`);
      });

      $(document).on('click', '.remove-tr', function(){
        $(this).parents('tr').remove();
      });

    </script>

  </body>
</html>
