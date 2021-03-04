clean:
	./scripts/clean

migrate_diff:
	./scripts/pull
	./scripts/standardize_dirs
	./scripts/compute_diff

generate_diff:
	./scripts/pull
	./scripts/compute_diff