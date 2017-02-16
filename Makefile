J2OBJC=$(HOME)/.j2objc/j2objc-1.0.0.2-mirego/j2objc
SQUIDB_SRC=squidb/src
SQUIDB_ANNOTATIONS_SRC=squidb-annotations/src
SQUIDB_JSON_SRC=squidb-addons/squidb-json/squidb-json-plugin/src
SQUIDB_JSON_ANNOTATIONS_SRC=squidb-addons/squidb-json/squidb-json-annotations/src
SQUIDB_IOS_SRC=squidb-ios/src
SQUIDB_IOS_NATIVE=squidb-ios/native

SOURCEPATH=$(SQUIDB_SRC):$(SQUIDB_ANNOTATIONS_SRC):$(SQUIDB_JSON_SRC):$(SQUIDB_JSON_ANNOTATIONS_SRC):$(SQUIDB_IOS_SRC)

j2objc:
	find $(SQUIDB_SRC) $(SQUIDB_IOS_SRC) $(SQUIDB_ANNOTATIONS_SRC) -name "*.java" | xargs $(J2OBJC) \
		-sourcepath "$(SOURCEPATH)" \
		-d squidb-ios/j2objc \
		-encoding UTF-8 \
		-Werror \
		--batch-translate-max=4096 \
		--build-closure \
		--doc-comments \
		--generate-deprecated \
		-J-Xmx2G \
		--no-package-directories \
		-use-arc \
		--nullability \
		--swift-friendly \

clean:
	rm -rf squidb-ios/j2objc
