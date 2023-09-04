import android.os.Environment
import android.os.StatFs

object StorageUtil {
    fun getInternalStorageInfo(): String {
        val statFs = StatFs(Environment.getDataDirectory().path)
        val blockSize = statFs.blockSizeLong
        val totalBlocks = statFs.blockCountLong
        val availableBlocks = statFs.availableBlocksLong

        val totalSize = blockSize * totalBlocks
        val availableSize = blockSize * availableBlocks
        val usedSize = totalSize - availableSize

        return "Total: $totalSize, Available: $availableSize, Used: $usedSize"
    }
}
