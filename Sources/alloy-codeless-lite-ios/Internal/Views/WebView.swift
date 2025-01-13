import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    var url: String
    var onFinish: ((FinishJourneyResult) -> Void)?
    weak var presenter: UIViewController?

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
                        Task {
                            if let data = try await AlloyCodelessLiteiOS.shared.getJourneyData() {
                                completion(FinishJourneyResult(finishResultCode: data.status ?? "", finishResultMessage: data.journeyApplicationStatus ?? "", journeyResultData: data))
                                self.parent.presenter?.dismiss(animated: true)
                            } else {
                                completion(FinishJourneyResult(finishResultCode: "", finishResultMessage: "", journeyResultData: nil))
                                self.parent.presenter?.dismiss(animated: true)
                            }
                        }
                    } else {
                        self.parent.presenter?.dismiss(animated: true)
                    }
                    return
                }
            }

            decisionHandler(.allow)
        }
    }
}

internal class WebViewController: UIHostingController<WebView> {

    private weak var presenter: UIViewController?

    @MainActor
    public init(url: String,
                onFinish: @escaping (FinishJourneyResult) -> Void,
                presenter: UIViewController) {
        self.presenter = presenter
        super.init(rootView: WebView(url: url, onFinish: onFinish, presenter: presenter))
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: WebView(url: ""))
    }

}
