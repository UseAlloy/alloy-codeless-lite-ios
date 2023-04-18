import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    var url: String
    var onFinish: ((FinishJourneyResult) -> Void)?

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true

        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = false
        webView.scrollView.bounces = false

        webView.load(URLRequest(url: URL(string: url)!))
    }

    func makeCoordinator() -> Coodinator {
        return Coodinator(self)
    }

    class Coodinator: NSObject, WKNavigationDelegate {

        let parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let host = navigationAction.request.url?.host {
                if host.contains("exit") {
                    decisionHandler(.cancel)
                    if let completion = parent.onFinish {
                        completion(FinishJourneyResult(finishResultCode: .FINISH_RESULT_COMPLETED, finishResultMessage: "", journeyResultData: nil))
                    }
                    self.parent.dismiss()
                    return
                }
            }

            decisionHandler(.allow)
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
            // WORKAROUND -> remove timer and resolve problem 🧁
            let js = "setTimeout(() => { console.log('running'); var exitButton = document.getElementsByClassName('sc-bcXHqe dewIvy sc-8c81409-0 eZrISL')[0]; exitButton.addEventListener('click', function () {  document.location.href='http://exit'; }); console.log(exitButton); var closeButton = document.getElementsByClassName('sc-bcXHqe fIpteN sc-7e2d1fc9-9 hpbOxt')[0]; closeButton.addEventListener('click', function () {  document.location.href='http://exit'; });}, 5000);"
            webView.evaluateJavaScript(js)
        }

        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            let webView = object as? WKWebView
            if let key = change?[NSKeyValueChangeKey.newKey] {
                let stringKey = String(describing: key)
                if stringKey.contains("step-1") {
                    let js = "setTimeout(() => { console.log('running'); var closeButton = document.getElementsByClassName('sc-bcXHqe fIpteN sc-7e2d1fc9-9 hpbOxt')[0]; closeButton.addEventListener('click', function () {  document.location.href='http://exit'; }); console.log(exitButton); }, 500);"
                    webView?.evaluateJavaScript(js)
                }
            }
        }
    }
}

internal class WebViewController: UIHostingController<WebView> {

    @MainActor
    public init(url: String, onFinish: @escaping (FinishJourneyResult) -> Void) {
        super.init(rootView: WebView(url: url, onFinish: onFinish))
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: WebView(url: ""))
    }

}
