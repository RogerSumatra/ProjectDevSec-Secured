<?php include __DIR__ . '/layout/header.php'; ?>
<?php include __DIR__ . '/layout/sidebar.php'; ?>

<main>

  <?php $currentRole = $_SESSION['user']['role'] ?? 'jelata';?>
  <?php $csrf = $_SESSION['csrf_token']; ?>
  
  <h2>Add Tweet</h2>

  <?php if (!empty($error)) echo "<p style='color:red;'>$error</p>"; ?>

  <div class="tweet-add">
    <form method="POST" action="index.php?action=storeTweet" enctype="multipart/form-data">
      <textarea name="content" rows="4" style="width:100%;" placeholder="Write your tweet..." maxlength="<?= ($currentRole === 'ningrat') ? 1000 : 200; ?>" required></textarea>
      <br><br>
      <label>Image (optional):</label>
      <input type="file" name="image" accept="image/*">
      <input type="hidden" name="csrf_token" value="<?= htmlspecialchars($csrf) ?>">
      <br><br>
      <button type="submit">Post</button>
    </form>
  </div>
</main>
