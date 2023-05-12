
source(file.path(Sys.getenv(
   if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"
 ), ".vscode-R", "init.R"))

options(vsc.globalenv = TRUE)

if (interactive() && Sys.getenv("TERM_PROGRAM") == "vscode") {
  if ("httpgd" %in% .packages(all.available = TRUE)) {
    options(vsc.plot = FALSE)
    options(vsc.use_httpgd = TRUE)
    options(device = function(...) {
      httpgd::hgd(silent = TRUE)
      .vsc.browser(httpgd::hgd_url(history = FALSE), viewer = "Beside")
    })
  }
}
