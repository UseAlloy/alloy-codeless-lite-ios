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

        @MainActor
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let host = navigationAction.request.url?.host {
                if host.contains("exit") {
                    decisionHandler(.cancel)
                    if let completion = parent.onFinish {
                        completion(FinishJourneyResult(finishResultCode: .FINISH_RESULT_COMPLETED, finishResultMessage: "", journeyResultData: nil))
                    }
                    UIUtils.dismissCurrentView()
                    return
                }
            }

            decisionHandler(.allow)
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
