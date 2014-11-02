// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require vendor/caman.full
//= require vendor/lodash.min
//= require foundation

//= require_tree .

$(function(){ $(document).foundation(); });

(function() {
    var f, c, e, b, d, i, a, h, g = {}.hasOwnProperty;
    var imagedirty = false;
    c = null;
    i = null;
    b = {};
    f = false;
    e = false;
    a = _.throttle(function() {
        var j, k;
        if (f) {
            e = true;
            return
        } else {
            e = false
        }
        f = true;
        c.revert(false);
        for (j in b) {
            if (!g.call(b, j)) {
                continue
            }
            k = b[j];
            k = parseFloat(k, 10);
            if (k === 0) {
                continue
            }
            c[j](k)
        }
        return c.render(function() {
            f = false;
            if (e) {
                return a()
            }
        })
    }, 300);
    d = false;
    h = function(k) {
        var l, j;
        if (d) {
            return
        }
        $("#PresetFilters a").removeClass("Active");
        l = $("#PresetFilters a[data-preset='" + k + "']");
        j = l.html();
        l.addClass("Active").html("Rendering...");
        d = true;
        i.revert(false);
        i[k]();
        return i.render(function() {
            l.html(j);
            return d = false
        })
    };
    $(document).ready(function() {
        if (!($("#image").length > 0)) {
            return
        }
        c = Caman("#image");
        $(".FilterSetting input").each(function() {
            var j;
            j = $(this).data("filter");
            return b[j] = $(this).val()
        });
        $("#Filters").on("change", ".FilterSetting input", function() {
            var j, k;
            imagedirty = true;
            j = $(this).data("filter");
            k = $(this).val();
            b[j] = k;
            $(this).find("~ .FilterValue").html(k);
            return a()
        });
        $('#somethingelse').on('click', function(evt) {
            var formData = new FormData(document.forms.namedItem("image_form"));
            // var description = $('#image_description').val();
            // var title = $('#image_title').val();

            // formData.append("description", description);
            // formData.append("title", title);

            if(imagedirty) {
                // JavaScript file-like object...
                var content = c.toBase64(); // the body of the new file...
                console.log(content);
                var blob = new Blob([content], { type: "image/png"});

                formData.append("image[image]", blob);
            }

            var imageSubmitPath = $(this).attr('data-submit-path');
            var request = new XMLHttpRequest();
            request.open("PATCH", imageSubmitPath);
            request.send(formData);
            evt.preventDefault();
            window.location = imageSubmitPath;
        })
        return $("#PresetFilters").on("click", "a", function() {
            return h($(this).data("preset"))
        })
    })
}).call(this);