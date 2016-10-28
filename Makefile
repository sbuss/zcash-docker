out/zcashd:
	mkdir -p $(PWD)/out
	docker build -f builder.Dockerfile -t zcashd-builder .
	docker run --rm -v $(PWD)/out:/out zcashd-builder

.PHONY:zcashd
zcashd: out/zcashd
	docker build -f Dockerfile -t sbuss/zcashd .

run: zcashd
	docker run --rm -it -P -v $(HOME)/.zcash:/root/.zcash -v $(HOME)/.zcash-params:/root/.zcash-params sbuss/zcashd
