clean:
	./scripts/clean

generate_diff:
	./scripts/pull
	./scripts/standardize_dirs
	./scripts/compute_diff