<%--
  Created by IntelliJ IDEA.
  User: askih
  Date: 12/16/2022
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="canonical" href="https://demo-basic.adminkit.io/"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <link href="<%=request.getContextPath()%>/views/admin/css/app.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <title>Update</title>
    <style>
        .styled-table{
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            font-family: sans-serif;
            min-width: 400px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }
        .styled-table thead tr {
            background-color: #009879;
            color: #ffffff;
            text-align: left;
        }
        .styled-table th,
        .styled-table td {
            padding: 12px 15px;
        }
        .styled-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        .styled-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        .styled-table tbody tr:last-of-type {
            border-bottom: 2px solid #009879;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1 style="text-align: center">Edit Company</h1>
<form  action="<%=request.getContextPath()%>/company/edit" method="post">
    <table id="example1" class="table table-bordered table-striped text-center styled-table">
        <tr>
            <th>Id</th>
            <td><input type="text" name="id" value="${company.id}"/></td>
        </tr>
        <tr>
            <th>Name</th>
            <td><input type="text" name="name" value="${company.name}"/></td>
        </tr>
        <tr>
            <th>Address</th>
            <td> <input type="text" name="address" value="${company.address}"/></td>
        </tr>
        <tr>
            <th colspan="2"><input type="submit" value="Update" class="btn btn-primary"/></th>
        </tr>
    </table>
</form>

<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>
<script>

    function displayLink(link) {
        const node = document.getElementById("displayUpload");
        const addInput = document.createElement("input");
        const br = document.createElement("br");
        addInput.name = "listavatar";
        addInput.value = link;
        addInput.readOnly;
        node.appendChild(br)
        node.appendChild(addInput);
    }

    //BE SURE TO PROTECT EVERYTHING IN THE CONFIG
    //DON'T COMMIT IT!!!

    // Initialize Firebase
    const firebaseConfig = {
        apiKey: "AIzaSyAw8_HPDCw5JtLmA6g2KmcGIRWSoLOcGbI",
        authDomain: "fir-4144d.firebaseapp.com",
        projectId: "fir-4144d",
        storageBucket: "fir-4144d.appspot.com",
        messagingSenderId: "85816360228",
        appId: "1:85816360228:web:ce0f7ea4972878e768c7b1",
        measurementId: "G-XMN5F4B3MY"
    };
    firebase.initializeApp(firebaseConfig);
</script>

<script type="text/javascript">


    // get elements
    var uploader = document.getElementById('uploader');
    var fileButton = document.getElementById('fileButton');
    let totalLinks = [];

    // listen for file selection
    fileButton.addEventListener('change', function (e) {

        // get file
        for (var i = 0; i < e.target.files.length; i++) {
            var imageFile = e.target.files[i];
            uploadImageAsPromise(imageFile);
        }



    });

    function uploadImageAsPromise(imageFile) {
        return new Promise(function (resolve, reject) {
            var storageRef = firebase.storage().ref("images" + "/" + imageFile.name);

            //Upload file
            var task = storageRef.put(imageFile);

            //Update progress bar
            task.on('state_changed',
                function progress(snapshot) {
                    var percentage = snapshot.bytesTransferred / snapshot.totalBytes * 100;

                },
                function error(err) {

                },
                function complete() {
                    var downloadURL = task.snapshot.downloadURL;
                    displayLink(downloadURL)
                }
            );
        });
    }

</script>
</body>
</html>