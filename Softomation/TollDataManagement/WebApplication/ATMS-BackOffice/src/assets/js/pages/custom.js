



// -------------------------------------------- Form Wizard -----------------------------------------------


$(document).ready(function () {
    $("#basic-pills-wizard").bootstrapWizard({ tabClass: "nav nav-pills nav-justified" }),
        $("#progrss-wizard").bootstrapWizard({
            onTabShow: function (a, r, i) {
                var t = ((i + 1) / r.find("li").length) * 100;
                $("#progrss-wizard")
                    .find(".progress-bar")
                    .css({ width: t + "%" });
            },
        });
});
var triggerTabList = [].slice.call(document.querySelectorAll(".twitter-bs-wizard-nav .nav-link"));
triggerTabList.forEach(function (a) {
    var r = new bootstrap.Tab(a);
    a.addEventListener("click", function (a) {
        a.preventDefault(), r.show();
    });
});


// -------------------------------------------- Form Wizard ----------------------------------------------


// -------------------------------------------- List Add Form -------------------------------------------


$(document).ready(function () {
    $("#addproduct-nav-pills-wizard").bootstrapWizard({ tabClass: "nav nav-pills nav-justified" });
}),
    $(".select2").select2();
var triggerTabList = [].slice.call(document.querySelectorAll(".twitter-bs-wizard-nav .nav-link"));
triggerTabList.forEach(function (t) {
    var a = new bootstrap.Tab(t);
    t.addEventListener("click", function (t) {
        t.preventDefault(), a.show();
    });
});


// -------------------------------------------- List Add Form End ------- -----------------------------------

