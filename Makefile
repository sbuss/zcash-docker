out/zcashd:
	mkdir -p $(pwd)/out
	docker build -f builder.Dockerfile -t zcashd-builder .
	docker run --rm -v $(pwd)/out:/out zcashd-builder

run: out/zcashd
	docker build -f Dockerfile -t sbuss/zcashd .
	docker run --rm -it -v $HOME/.zcash:/root/.zcash -v $HOME/.zcash-params:/root/.zcash-params sbuss/zcashd
